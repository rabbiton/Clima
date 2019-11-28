//
//  WeatherManager.swift
//  Clima
//
//  Created by Yarema Zaiachuk on 28.11.2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6f875422f88591f494424d7d666ad087&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, resond, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parceJSON(weatherData: safeData)
                }
            }
            
            task.resume()
        }
    }
    
    func parceJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print(weather.temperatureString)
        } catch {
            print(error)
        }
    }
    
}
