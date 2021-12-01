//
//  WeatherService.swift
//  Weather
//
//  Created by Joshua Taylor on 9/6/21.
//

import Foundation

protocol WeatherServiceDelegate: AnyObject {
    func didFetchWeather(weatherService: WeatherService, result: WeatherResult)
}


class WeatherService {
    
    weak var delegate: WeatherServiceDelegate?

    let dataLoader = DataLoader()
    
    func fetchWeatherData(city: String) {

        dataLoader.request(.city(city)) { [weak self] result in

            switch result {
            case .success(let data):

                guard let weather = self?.parseJson(weatherData: data) else {
                    DispatchQueue.main.async {
                        self?.updateDidFetchWeather(weatherResult: .failure(.parsing))
                    }
                    return
                }

                let weatherModel = WeatherModel(city: weather.name, temperature: weather.main.temp, conditionId: weather.weather[0].id)
                DispatchQueue.main.async {
                    self?.updateDidFetchWeather(weatherResult: .success(weatherModel))
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    self?.updateDidFetchWeather(weatherResult: .failure(error))
                }
            }
        }
    }
    
    func fetchWeatherData(lat: Double, lon: Double) {

        dataLoader.request(.latLon(lat: lat, lon: lon)) { [weak self] result in

            switch result {
            case .success(let data):

                guard let weather = self?.parseJson(weatherData: data) else {
                    DispatchQueue.main.async {
                        self?.updateDidFetchWeather(weatherResult: .failure(.parsing))
                    }
                    return
                }

                let weatherModel = WeatherModel(city: weather.name, temperature: weather.main.temp, conditionId: weather.weather[0].id)
                DispatchQueue.main.async {
                    self?.updateDidFetchWeather(weatherResult: .success(weatherModel))
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    self?.updateDidFetchWeather(weatherResult: .failure(error))
                }
            }
        }
    }
    
    private func updateDidFetchWeather(weatherResult: WeatherResult) {
        delegate?.didFetchWeather(weatherService: self, result: weatherResult)
    }
    
    func parseJson(weatherData: Data) -> OpenWeatherData? {
        
        guard let decodedData = try? JSONDecoder().decode(OpenWeatherData.self, from: weatherData) else {
            return nil
        }
        return decodedData
    }
}

