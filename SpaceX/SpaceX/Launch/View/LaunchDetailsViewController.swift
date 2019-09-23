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
  @IBOutlet weak var wikipediaLabel: UILabel! {
    didSet {
      let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
      wikipediaLabel.addGestureRecognizer(tap)
      wikipediaLabel.isUserInteractionEnabled = true
    }
  }

  var viewModel: LaunchDetailsViewModel!
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }

  func configureView() {
    missionNameLabel.text = viewModel.missionName
    wikipediaLabel.text = viewModel.wikipediaURL
  }

  @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
    guard let url = URL(string: viewModel.wikipediaURL) else {
      return
    }
    if #available(iOS 10.0, *) {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
      UIApplication.shared.openURL(url)
    }
  }
}
