//
//  WeatherData.swift
//  Clima
//
//  Created by Yarema Zaiachuk on 28.11.2019.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
}

struct  Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
