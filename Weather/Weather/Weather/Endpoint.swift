//
// Created by Joshua Taylor on 9/20/21.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/" + path
        components.queryItems = getCommonQueryItems() + queryItems

        return components.url
    }
    
    private func getCommonQueryItems() -> [URLQueryItem] {
        return [URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "appid", value: "75290d7ca52998c183fb7e90dfc4ac90")]

    }
}

extension Endpoint {
    static func city(_ city: String) -> Self {
        return Endpoint(
                path: "data/2.5/weather",
                queryItems: [
                    URLQueryItem(name: "q", value: city)
                ]
        )
    }

    static func latLon(lat: Double, lon: Double) -> Self {
        return Endpoint(
                path: "data/2.5/weather",
                queryItems: [
                    URLQueryItem(name: "lat", value: String(lat)),
                    URLQueryItem(name: "lon", value: String(lon))
                ]
        )
    }
}
