//
//  LaunchDetailsViewModel.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import Foundation

class LaunchDetailsViewModel {
  let rocket: RocketDetails
  let launch: Launch

  init(withDetails rocket: RocketDetails, launch: Launch) {
    self.rocket = rocket
    self.launch = launch
  }

  var title: String {
    return "Details"
  }
  
  var missionName: String {
    return launch.missionName
  }

  var wikipediaURL: String {
    return rocket.wikipedia
  }
}
