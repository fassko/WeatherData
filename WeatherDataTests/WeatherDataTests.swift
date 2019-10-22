//
//  WeatherDataTests.swift
//  WeatherDataTests
//
//  Created by Kristaps Grinbergs on 22/10/2019.
//  Copyright © 2019 fassko. All rights reserved.
//

import XCTest

@testable import WeatherData

class WeatherDataTests: XCTestCase {
  
  var viewModel: WeatherDataViewModel!
  
  override func setUp() {
    viewModel = WeatherDataViewModel()
  }
  
  func testDataLoad() {
    let dataLoadingExpectation = expectation(description: "load data")
    
    viewModel.getWeatherData { data in
      XCTAssertFalse(data.temperature.isEmpty)
      XCTAssertFalse(data.wind.isEmpty)
      XCTAssertFalse(data.liveImageURL.isEmpty)
      
      dataLoadingExpectation.fulfill()
    }
    
    wait(for: [dataLoadingExpectation], timeout: 1.0)
  }
  
}
