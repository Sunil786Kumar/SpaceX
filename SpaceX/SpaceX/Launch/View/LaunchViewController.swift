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
    }
  }
  var viewModel: LaunchViewModel!
  let service = LaunchService()

  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel = LaunchViewModel(withService: service, presenter: self)
    configureCell()
    configureNavigationBar()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.launchDetails()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == viewModel.detailsSegue,
      let vc = segue.destination as? LaunchDetailsViewController,
      let rocket = viewModel.rocket, let launch = viewModel.launch else {
        return
    }
    vc.viewModel = LaunchDetailsViewModel(withDetails: rocket, launch: launch)
  }

  func configureNavigationBar() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: viewModel.barButtonTitle,
                                                        style: .plain,
                                                        target: self,
                                                        action: #selector(sortTapped))
  }

  func configureCell() {
    tableView.register(UINib(nibName: viewModel.cellName, bundle: nil),
                       forCellReuseIdentifier: viewModel.cellName)
  }

  @objc func sortTapped(sender: UIBarButtonItem) {
    showSortingOptions()
  }


  func showSortingOptions() {
    let alert = UIAlertController(title: nil, message: "Sort by", preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "Year", style: .default, handler: { [weak self] (_) in
      self?.viewModel.sortLaunches(byType: .year)
    }))
    alert.addAction(UIAlertAction(title: "Mission Name", style: .default, handler: { [weak self] (_) in
      self?.viewModel.sortLaunches(byType: .mission)
    }))
    alert.addAction(UIAlertAction(title: "Mission Success", style: .default, handler: { [weak self] (_) in
      self?.viewModel.sortLaunches(byType: .success)
    }))
    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
    }))
    self.present(alert, animated: true, completion: {
      print("completion block")
    })
  }
}

extension LaunchViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.didSelectLaunch(atIndex: indexPath.row)
  }
}

extension LaunchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellName, for: indexPath) as? LaunchTableViewCell,
      let model = viewModel.modelForRowAtIndex(index: indexPath.row) else {
      return UITableViewCell()
    }
    cell.configure(model: model)
    return cell
  }
}

extension LaunchViewController: LaunchPresenterProtocol {
  func displayDetails() {
    performSegue(withIdentifier: viewModel.detailsSegue, sender: self)
  }

  func reloadData() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}


