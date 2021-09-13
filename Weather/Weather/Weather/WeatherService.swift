//
//  WeatherService.swift
//  Weather
//
//  Created by Joshua Taylor on 9/6/21.
//

import Foundation

typealias WeatherResult = Result<WeatherModel, WeatherServiceError>

enum WeatherServiceError: Error {
    case network(statusCode: Int)
    case parsing
    case general(reason: String)
}

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

protocol WeatherServiceDelegate: AnyObject {
    func didFetchWeather(weatherSerivce: WeatherService, result: WeatherResult)
}


class WeatherService {
    
    weak var delegate: WeatherServiceDelegate?
    
    var url = URL(string: "api.openweathermap.org/data/2.5/weather?appid={apiKey}&units=metric")!
    
//    func featchWeather() {
//
//        let weather = WeatherModel(city: "Chicago", temperature: "45", imageName: "sunset.fill")
//
//        updateDidFetchWeather(weatherResult: .success(weather))
//    }
    
    func fetchWeatherData(city: String) {
        
        //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
        
        let urlString = "\(url)&q=\(city)"
        
        performRequest(with: urlString)
    }
    
    func fetchWeatherData(lat: Double, long: Double) {
        
        //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
        
        let urlString = "\(url)&lat=\(lat)&lon=\(long)"
        
        performRequest(with: urlString)
        
        
    }
    
    private func updateDidFetchWeather(weatherResult: WeatherResult) {
        delegate?.didFetchWeather(weatherSerivce: self, result: weatherResult)
    }
    
    func performRequest(with urlString: String) {
        
        let session = URLSession.shared
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url, completionHandler: { [weak self] data, response, error in
                
            guard let unwrapedData = data,
                              let httpResponse = response as? HTTPURLResponse
                        else { return }
            
            guard error == nil else {
                // OH NO! An error occurred...
                DispatchQueue.main.async {
                    self?.updateDidFetchWeather(weatherResult: .failure(.general(reason: error!.localizedDescription)))
                }
                
                return
            }
            
            guard 200 == httpResponse.statusCode else {
                DispatchQueue.main.async {
                    self?.updateDidFetchWeather(weatherResult: .failure(.network(statusCode: httpResponse.statusCode)))
                }
                return
            }
            
            guard let weather = self?.parseJson(weatherData: unwrapedData) else {
                DispatchQueue.main.async {
                    self?.updateDidFetchWeather(weatherResult: .failure(.parsing))
                }
                return
            }
            
            DispatchQueue.main.async {
                self?.updateDidFetchWeather(weatherResult: .success(weather))
            }
        
            
        })
        
        task.resume()
    }
    
    func parseJson(weatherData: Data) -> WeatherModel? {
        
        guard let decodedData = try? JSONDecoder().decode(WeatherModel.self, from: weatherData) else {
        DispatchQueue.main.async {
            self.updateDidFetchWeather(weatherResult: .failure(.parsing))
            }
            return nil
        }
        return nil
    }
}

