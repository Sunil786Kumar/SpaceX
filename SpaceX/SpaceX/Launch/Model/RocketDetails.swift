//
//  RocketDetails.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import Foundation

struct RocketDetails: Codable {
  let wikipedia: String

  private enum CodingKeys: String, CodingKey {
    case wikipedia
  }
}
