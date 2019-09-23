//
//  LaunchTableViewCell.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {

  @IBOutlet weak var missionNameLabel: UILabel!
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var yearOfLaunchLabel: UILabel!

  func configure(model: Launch) {
    missionNameLabel.text = model.missionName
    yearOfLaunchLabel.text = model.year
    resultLabel.text = model.success ?? false ? "Success" : "Failed"
  }
}
