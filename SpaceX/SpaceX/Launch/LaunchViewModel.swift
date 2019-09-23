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
    launchDetails()
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
