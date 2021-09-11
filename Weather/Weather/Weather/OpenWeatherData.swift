//
// Created by Joshua Taylor on 9/10/21.
//

import Foundation

/*
 {
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 16093,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },
  "clouds": {
    "all": 1
  },
  "dt": 1560350645,
  "sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
  }
 */

struct OpenWeatherData: Codable {

    let weather: [Weather]
    let coord: Coord
    let wind: Wind
    let visibility: Int
    let main: Main

    func getWeatherModel() -> WeatherModel {

        return WeatherModel(city: <#T##String##Swift.String#>, temperature: <#T##String##Swift.String#>, imageName: <#T##String##Swift.String#>)


    }

}

struct Main: Codable {

    let temp: String
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double

}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
}