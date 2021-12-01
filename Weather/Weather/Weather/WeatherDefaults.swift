//
// Created by Joshua Taylor on 9/15/21.
//

import Foundation


class WeatherDefaults {

    private static let key = "weatherModel"

    class func getWeatherData() -> WeatherModel? {

        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Weather
                return try decoder.decode(WeatherModel.self, from: data)

            } catch {
                return nil
            }
        }

        return nil

    }

    class func saveWeatherData(weatherData: WeatherModel) {

        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode WeatherData
            let weatherData = try encoder.encode(weatherData)

            // Write/Set Data
            UserDefaults.standard.set(weatherData, forKey: key)

        } catch {
            print("Unable to Encode WeatherData (\(error))")
        }

    }



}