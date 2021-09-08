//
//  WeatherService.swift
//  Weather
//
//  Created by Joshua Taylor on 9/6/21.
//

import Foundation

enum WeatherServiceError: Error {
    case network(statusCode: Int)
    case parsing
    case general(reason: String)
}

protocol WeatherServiceDelegate: AnyObject {
    func didFeatchWeather(weatherSerivce: WeatherService, weatherData: WeatherModel)
    func didFailWithError(weatherSerivce: WeatherService, error: WeatherServiceError)
}


class WeatherService {
    
    weak var delegate: WeatherServiceDelegate?
    
    func featchWeather() {
        
        let weather = WeatherModel(city: "Chicago", temperature: "45", imageName: "sunset.fill")
        delegate?.didFeatchWeather(weatherSerivce: self, weatherData: weather)
    }
    
    
}
