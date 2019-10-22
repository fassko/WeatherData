//
//  WeatherDataViewModel.swift
//  WeatherData
//
//  Created by Kristaps Grinbergs on 22/10/2019.
//  Copyright © 2019 fassko. All rights reserved.
//

import Foundation

import TartuWeatherProvider

struct WeatherData {
  let temperature: String
  let wind: String
  let liveImageURL: String
}

struct WeatherDataViewModel {
  
  func getWeatherData(_ completion: @escaping (WeatherData) -> Void) {
    TartuWeatherProvider.getWeatherData { result in
      switch result {
      case .success(let data):
        let weatherData = WeatherData(temperature: data.temperature,
                                      wind: "\(data.wind) \(data.windDirection)",
                                      liveImageURL: data.liveImage.large)
        
        completion(weatherData)
      case .failure(let error):
        assertionFailure("Can't get data \(error.localizedDescription)")
      }
    }
  }
}
