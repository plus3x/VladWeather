//
//  Weather.swift
//  VladWeather
//
//  Created by Vladislav Petrov on 27.01.2020.
//  Copyright © 2020 Vladislav Petrov. All rights reserved.
//

import Foundation

struct Forecast: Codable {
    enum Option {
        case lat, lon, limit, hours, lang, extra
    }
    
    struct Fact: Codable {
        var temp: Int
        var feels_like: Int
        var pressure_mm: Int
        var humidity: Int
    }
    
    var fact: Fact
}
