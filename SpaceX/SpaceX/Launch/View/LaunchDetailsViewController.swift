//
//  LaunchDetailsViewController.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import UIKit

class LaunchDetailsViewController: UIViewController {

  @IBOutlet weak var missionNameLabel: UILabel!
  @IBOutlet weak var wikipediaLabel: UILabel!

  var viewModel: LaunchDetailsViewModel!
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }

  func configureView() {
    missionNameLabel.text = viewModel.missionName
    wikipediaLabel.text = viewModel.wikipediaURL
  }

}
