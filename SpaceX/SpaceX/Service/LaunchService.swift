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
  func fetchAllLaunches(completion: @escaping ([Launch]?) -> ()) {
    let url = URL(string: "https://api.spacexdata.com/v3/launches")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let dataResponse = data, error == nil else {
        print(error?.localizedDescription ?? "Response Error")
        completion(nil)
        return
      }
      do{
        let decoder = JSONDecoder()
        let model = try decoder.decode([Launch].self, from: dataResponse)
        completion(model)
      } catch let parsingError {
        print("Error", parsingError)
      }
    }
    task.resume()
  }

  func launchDetails(withId id: Int, completion: @escaping (Launch?) -> ()) {
    let url = URL(string: "https://api.spacexdata.com/v3/launches/" + id.description)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let dataResponse = data, error == nil else {
        print(error?.localizedDescription ?? "Response Error")
        completion(nil)
        return
      }
      do{
        let decoder = JSONDecoder()
        let model = try decoder.decode(Launch.self, from: dataResponse)
        completion(model)
      } catch let parsingError {
        print("Error", parsingError)
      }
    }
    task.resume()
  }

  func rocketDetails(withId id: String, completion: @escaping (RocketDetails?) -> ()) {
    let url = URL(string: "https://api.spacexdata.com/v3/rockets/" + id)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let dataResponse = data, error == nil else {
        print(error?.localizedDescription ?? "Response Error")
        completion(nil)
        return
      }
      do{
        let decoder = JSONDecoder()
        let model = try decoder.decode(RocketDetails.self, from: dataResponse)
        completion(model)
      } catch let parsingError {
        print("Error", parsingError)
      }
    }
    task.resume()
  }
}
