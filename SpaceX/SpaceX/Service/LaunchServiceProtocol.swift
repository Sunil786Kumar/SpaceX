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
}
