//
//  LaunchServiceProtocol.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import Foundation

protocol LaunchServiceProtocol {

  func fetchAllLaunches(completion: @escaping ([Launch]?) -> ())
  func launchDetails(withId id: Int, completion: @escaping (Launch?) -> ())
  func rocketDetails(withId id: String, completion: @escaping (RocketDetails?) -> ())
}
