//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import Foundation

enum SortType {
  case year
  case mission
  case success
}
protocol LaunchPresenterProtocol {
  func reloadData()
  func displayDetails()
}

class LaunchViewModel {
  let service: LaunchServiceProtocol
  let presenter : LaunchPresenterProtocol
  var rocket: RocketDetails?
  var launch: Launch?

  let dispatchGroup = DispatchGroup()

  var allLaunches : [Launch]? {
    didSet {
      presenter.reloadData()
    }
  }

  var cellName: String {
    return "LaunchTableViewCell"
  }

  var barButtonTitle: String {
    return "Sort"
  }

  var detailsSegue: String {
    return "showDetails"
  }

  //TODO:
  // other strings can come here

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

  func didSelectLaunch(atIndex index: Int) {
    guard let launches = allLaunches, index < launches.count  else {
      return
    }
    let launch = launches[index]
    launchDetails(for: launch)
    rocketDetails(withId: launch.rocket.id)
    dispatchGroup.notify(queue: .main) {
      self.presenter.displayDetails()
    }
  }

  func launchDetails(for launch: Launch) {
    dispatchGroup.enter()
    service.launchDetails(withId: launch.flightNumber, completion: { [weak self] (launch) in
      guard let self = self else {
        return
      }
      self.dispatchGroup.leave()
      self.launch = launch
    })
  }

  func rocketDetails(withId id: String) {
    dispatchGroup.enter()
    service.rocketDetails(withId: id, completion: { [weak self] (rocketDetails) in
      guard let self = self, let rocket = rocketDetails else {
        return
      }
      self.dispatchGroup.leave()
      self.rocket = rocket
    })
  }

  func sortLaunches(byType type: SortType) {
    switch type {
    case .mission:
      allLaunches = allLaunches?.sorted { $0.missionName < $1.missionName }
    case .year:
      allLaunches = allLaunches?.sorted { $0.year < $1.year }
    case .success:
      allLaunches = allLaunches?.sorted { $0.success == true &&  $1.success == false }
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
