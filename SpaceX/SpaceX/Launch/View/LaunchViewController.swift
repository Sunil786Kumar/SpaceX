//
//  ViewController.swift
//  SpaceX
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(UINib(nibName: "LaunchTableViewCell", bundle: nil), forCellReuseIdentifier: "LaunchTableViewCell")
    }
  }
  var viewModel: LaunchViewModel!
  let service = LaunchService()

  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel = LaunchViewModel(withService: service, presenter: self)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.launchDetails()
  }
}

extension LaunchViewController: UITableViewDelegate {

}

extension LaunchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "LaunchTableViewCell", for: indexPath) as? LaunchTableViewCell,
      let model = viewModel.modelForRowAtIndex(index: indexPath.row) else {
      return UITableViewCell()
    }
    cell.configure(model: model)
    return cell
  }
}

extension LaunchViewController: LaunchPresenterProtocol {
  func reloadData() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}


