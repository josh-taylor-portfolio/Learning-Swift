//
// Created by Joshua Taylor on 9/20/21.
//

import Foundation

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

enum ViewState<Model, Error: Swift.Error> {
    case presenting(Model)
    case failed(Error)
}

typealias WeatherResult = Result<WeatherModel, WeatherServiceError>
typealias ViewStateResult = Result<WeatherModel, WeatherServiceError>
typealias DataHandlerResult = Result<Data, WeatherServiceError>

enum WeatherServiceError: Error {
    case parsing
    case network(statusCode: Int)
    case general(reason: String)
    case data(reason: String)
    case invalidUrl
}
