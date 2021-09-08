import UIKit

let weatherData = """
 {
    "temp": "35",
    "city": "Chicgo",
    "location": {
        "lat": 90,
        "long": 34
    }
 }
"""

// JSON > Swift (struct or class)
struct WeatherData: Codable {
    let temp: String
    let city: String
    let location: Location

    struct Location: Codable {
        let latitude: Double
        let longitude: Double

        enum CodingKeys: String, CodingKey {
            case latitude = "lat"
            case longitude = "long"
        }
    }
}

let jsonData = weatherData.data(using: .utf8)!
let weather = try! JSONDecoder().decode(WeatherData.self, from: jsonData)

weather
weather.temp
weather.city
weather.location
weather.location.latitude
weather.location.longitude
