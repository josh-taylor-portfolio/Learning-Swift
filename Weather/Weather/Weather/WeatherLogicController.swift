//
// Created by Joshua Taylor on 9/28/21.
//

import Foundation

class WeatherLogicController {

    let dataLoader = DataLoader()

    func getWeatherForCity(city: String, then handler: @escaping (ViewStateResult) -> Void) {

        dataLoader.request(.city(city)) { [weak self] result in

            switch result {
            case .success(let data):
                guard let weatherData = self?.parseJson(weatherData: data) else {
                    return handler(.failure(.parsing))
                }
                let weatherModel = WeatherModel(city: weatherData.name, temperature: weatherData.main.temp, conditionId: weatherData.weather[0].id)
                handler(.success(weatherModel))

            case .failure(let error):
                handler(.failure(error))
            }

        }
    }


    func getWeatherForLatLon(lat: Double, lon: Double, then handler: @escaping (ViewStateResult) -> Void) {

        dataLoader.request(.latLon(lat: lat, lon: lon)) { [weak self] result in
            switch result {
            case .success(let data):
                guard let weatherData = self?.parseJson(weatherData: data) else {
                    return handler(.failure(.parsing))
                }
                let weatherModel = WeatherModel(city: weatherData.name, temperature: weatherData.main.temp, conditionId: weatherData.weather[0].id)
                handler(.success(weatherModel))

            case .failure(let error):
                handler(.failure(error))
            }

        }
    }

    func parseJson(weatherData: Data) -> OpenWeatherData? {

        guard let decodedData = try? JSONDecoder().decode(OpenWeatherData.self, from: weatherData) else {
            return nil
        }
        return decodedData
    }

}
