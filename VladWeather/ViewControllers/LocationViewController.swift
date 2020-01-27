//
//  LocationViewController.swift
//  VladWeather
//
//  Created by Vladislav Petrov on 27.01.2020.
//  Copyright © 2020 Vladislav Petrov. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    var service: YandexWeatherForecastProvider = YandexWeatherForecastService()
    var location: Location?
    var forecast: Forecast?
    
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if location != nil {
            // Do with specific location
        } else {
            service.forecast(with: [:]) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let forecast):
                    self.configure(with: forecast)
                case .failure: break
                }
            }
        }
    }
    
    private func configure(with forecast: Forecast) {
        self.pressureLabel.text = "\(forecast.fact.pressure_mm)"
        self.temperatureLabel.text = "\(forecast.fact.temp)"
        self.feelsLikeLabel.text = "\(forecast.fact.feels_like)"
        self.humidityLabel.text = "\(forecast.fact.humidity)"
    }
}
