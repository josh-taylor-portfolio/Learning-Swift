//
//  CryptoRateService.swift
//  ProtocolDelegate
//
//  Created by Joshua Taylor on 9/7/21.
//

import Foundation

protocol CryptoServiceDelegate: AnyObject {
    func didFetchCyrptoPrice(cryptoService: CryptoRateService, cyrptoRate: CryptoRate)
}

protocol CryptoServiceDataSource: AnyObject {
    var symbol: String? { get }
}

struct CryptoRate {
    let rate: Double
    let symbol: String
}

class CryptoRateService {

    weak var delegate: CryptoServiceDelegate?
    weak var dataSource: CryptoServiceDataSource?

    func fetchCryptoRate() {

        //getRateForSymbol is an async call
        let cryptoRate = CryptoRate(rate: 3465.53, symbol: "Bitcoin")
        delegate?.didFetchCyrptoPrice(cryptoService: self, cyrptoRate: cryptoRate)
    }
}
