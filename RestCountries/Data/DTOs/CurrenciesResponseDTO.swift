//
//  CurrenciesDTO.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import Foundation

struct CurrenciesResponseDTO: Decodable {
    let currencies: [String: CurrencyResponseDTO]
}

extension CurrenciesResponseDTO {
    func toDomain() -> Currencies {
        let domainCurrency = currencies.mapValues { $0.toDomain() }
        return Currencies(currencies: domainCurrency)
    }
}

struct CurrencyResponseDTO: Decodable {
    let name: String
    let symbol: String
}

extension CurrencyResponseDTO {
    func toDomain() -> Currency {
        return  .init(name: name, symbol: symbol)
    }
}
