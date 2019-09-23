//
//  LaunchService.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import Foundation

enum RequestType {
  case allLaunces
  case launchDetail
  case rocketDetail
}

class LaunchService: LaunchServiceProtocol {

  func fetchAllLaunches() {
    let url = URL(string: "https://api.spacexdata.com/v3/launches")!

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let dataResponse = data,
        error == nil else {
          print(error?.localizedDescription ?? "Response Error")
          return }
      do{
        let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
        var model = [Launch]()
        guard let jsonArray = jsonResponse as? [[String: Any]] else {
          return
        }
        model = jsonArray.compactMap { dictionary in
          return Launch(dictionary)
        }
        print(model[0].missionName)
      } catch let parsingError {
        print("Error", parsingError)
      }
    }
    task.resume()
  }
}
