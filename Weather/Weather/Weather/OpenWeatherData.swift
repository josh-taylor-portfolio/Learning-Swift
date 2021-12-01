//
// Created by Joshua Taylor on 9/10/21.
//

import Foundation

struct OpenWeatherData: Codable {

    let weather: [Weather]
//    let coord: Coord
//    let wind: Wind
//    let visibility: Int
    let main: Main
    let name: String

}

struct Main: Codable {

    let temp: Double
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
    let gust: Double
}
