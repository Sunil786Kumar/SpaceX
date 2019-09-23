//
//  Launch.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import Foundation
/*
 "flight_number": 1,
 "mission_name": "FalconSat"
 "launch_year": "2006"
 "launch_date_utc": "2006-03-24T22:30:00.000Z"
 "rocket": {
 "rocket_id": "falcon1",
 "launch_success": false,

 */
struct Rocket {
  var rocketId: String

}
struct Launch {
  var flightNumber: Int
  var missionName: String
//  var year: String
//  var date: Date
//  var rocket: Rocket
//  var success: Bool

  init(_ dictionary: [String: Any]) {
    self.flightNumber = dictionary["flight_number"] as? Int ?? 0
    self.missionName = dictionary["mission_name"] as? String ?? ""
  }
}
