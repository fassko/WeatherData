//
//  ViewController.swift
//  WeatherData
//
//  Created by Kristaps Grinbergs on 22/10/2019.
//  Copyright © 2019 fassko. All rights reserved.
//

import UIKit

import Kingfisher

class ViewController: UIViewController {
  
  @IBOutlet weak var tempratureLabel: UILabel!
  @IBOutlet weak var windLabel: UILabel!
  
  @IBOutlet weak var liveImage: UIImageView!
  
  private var viewModel = WeatherDataViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.getWeatherData {[weak self] weatherData in
      self?.tempratureLabel.text = weatherData.temperature
      self?.windLabel.text = weatherData.wind
      
      let imageURL = URL(string: weatherData.liveImageURL)!
      
      self?.liveImage.kf.setImage(with: imageURL, options: [.forceRefresh])
    }
  }


}

