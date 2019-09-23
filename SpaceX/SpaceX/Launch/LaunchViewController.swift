//
//  ViewController.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
  var viewModel: LaunchViewModel!
  let service = LaunchService()

  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel = LaunchViewModel(withService: service, presenter: self)
  }
}

extension LaunchViewController: LaunchPresenterProtocol {
  func reloadData() {

  }
}


