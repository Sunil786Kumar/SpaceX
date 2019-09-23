//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import Foundation

protocol LaunchPresenterProtocol {
  func reloadData()
}

class LaunchViewModel {
  let service: LaunchServiceProtocol
  let presenter : LaunchPresenterProtocol

  var allLaunches : [Launch]? {
    didSet {
      presenter.reloadData()
    }
  }

  init(withService service: LaunchServiceProtocol, presenter: LaunchPresenterProtocol) {
    self.service = service
    self.presenter = presenter
  }

  func launchDetails() {
    service.fetchAllLaunches { [weak self] (launches) in
      guard let self = self else {
        return
      }
      self.allLaunches = launches
    }
  }
}

extension LaunchViewModel {
  func numberOfRows() -> Int {
    return allLaunches?.count ?? 0
  }

  func modelForRowAtIndex(index: Int) -> Launch? {
    guard let launches = allLaunches, index < launches.count  else {
      return nil
    }
    return launches[index]
  }
}
