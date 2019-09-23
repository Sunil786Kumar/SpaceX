//
//  Launch.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import Foundation

struct Rocket: Codable {
  var id: String
  var name: String
  
  private enum CodingKeys: String, CodingKey {
    case id = "rocket_id"
    case name = "rocket_name"
  }
}
struct Launch: Codable {
  var flightNumber: Int
  var missionName: String
  var year: String
  var date: String
  var rocket: Rocket
  var success: Bool?

  //Custom Keys
  private enum CodingKeys: String, CodingKey {
    case flightNumber = "flight_number"
    case missionName = "mission_name"
    case year = "launch_year"
    case date = "launch_date_utc"
    case rocket = "rocket"
    case success = "launch_success"
  }
}
