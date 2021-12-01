//
//  WeatherModel.swift
//  Weather
//
//  Created by Joshua Taylor on 9/6/21.
//

import Foundation
import UIKit

struct WeatherModel: Codable {
    
    let city: String
    let temperature: String
    let conditionId: Int
    let lastUpdated: String

    init(city: String, temperature: Double, conditionId: Int) {
        self.city = city
        self.temperature = String(format: "%.0f", temperature)
        self.conditionId = conditionId

        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        lastUpdated = formatter.string(from: Date())
    }


    func getWeatherImage() -> UIImage {
        var imageName: String
        switch conditionId {
        case 200...232:
            imageName = "cloud.bolt"
        case 300...321:
            imageName = "cloud.drizzle"
        case 500...531:
            imageName = "cloud.rain"
        case 600...622:
            imageName = "cloud.snow"
        case 701...781:
            imageName = "cloud.fog"
        case 800:
            imageName = "sun.max"
        case 801...804:
            imageName = "cloud.bolt"
        default:
            imageName = "cloud"
        }

        return UIImage(systemName: imageName)!

    }
}
