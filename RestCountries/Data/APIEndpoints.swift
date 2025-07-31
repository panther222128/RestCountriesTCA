//
//  APIEndpoints.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import Foundation

struct APIEndpoints {
    static func getCurrencies(requestDTO: CurrenciesRequestDTO) -> Endpoint<[CurrenciesResponseDTO]> {
        return Endpoint(path: "all", method: .get, queryParametersEncodable: requestDTO)
    }
}
