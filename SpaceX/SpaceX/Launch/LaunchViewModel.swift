//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import Foundation

protocol LaunchPresenterProtocol {

}

class LaunchViewModel {
  let service: LaunchServiceProtocol
  let presenter : LaunchPresenterProtocol

  init(withService service: LaunchServiceProtocol, presenter: LaunchPresenterProtocol) {
    self.service = service
    self.presenter = presenter
  }
}
