//
//  YandexWeatherForecast.swift
//  VladWeather
//
//  Created by Vladislav Petrov on 27.01.2020.
//  Copyright © 2020 Vladislav Petrov. All rights reserved.
//

import UIKit

typealias ForecastOptions = [Forecast.Option: String]

protocol YandexWeatherForecastProvider {
    @discardableResult func forecast(with options: ForecastOptions, completion: @escaping ResultHandler<Forecast>) -> URLSessionTask?
}

class YandexWeatherForecastService: YandexWeatherForecastProvider {
    private let forecastPath = "/forecast"
    private let defaultOptions: ForecastOptions = [
        .lat: "55.75396",
        .lon: "37.620393",
        .limit: "7",
        .lang: "en_US",
        .hours: "true",
        .extra: "true",
    ]
    
    @discardableResult func forecast(with options: ForecastOptions = [:], completion: @escaping ResultHandler<Forecast>) -> URLSessionTask? {
        let path = forecastPath + "?" + defaultOptions.map({ "\($0.key)=\(options[$0.key] ?? defaultOptions[$0.key] ?? "")" })
        .joined(separator: "&")

        let task = YandexWeatherService.request(path) { result in
            switch result {
            case .success(let data):
                if let forecast = try? JSONDecoder().decode(Forecast.self, from: data) {
                    completion(.success(forecast))
                } else {
                    completion(.failure(.invalidData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        return task
    }
}
