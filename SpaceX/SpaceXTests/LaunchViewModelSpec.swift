//
//  LaunchViewModelSpec.swift
//  SpaceXTests
//
//  Created by Sunil Kumar on 23/9/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import XCTest

@testable import SpaceX

class LaunchViewModelSpec: XCTestCase {

  let service = LaunchService()
  var viewModel: LaunchViewModel! = nil

  override func setUp() {
    viewModel = LaunchViewModel(withService: service, presenter: nil)
    viewModel.allLaunches = [Launch(flightNumber: 1, missionName: "Test", year: "2006", date: "date", rocket: Rocket(id: "falcon_test", name: "Falcon"), success: true),
                             Launch(flightNumber: 2, missionName: "HelloTest2", year: "2007", date: "date", rocket: Rocket(id: "falcon_test_1", name: "Falcon_1"), success: false)
    ]
  }

  func testNumberOfRows() {
    XCTAssertEqual(viewModel.numberOfRows(), 2, "Row count is not correct.")
  }

  func testSortByType() {
    viewModel.sortLaunches(byType: .mission)
    guard let launches = viewModel.allLaunches  else {
      return
    }
    XCTAssertEqual("HelloTest2", launches[0].missionName)
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
}
