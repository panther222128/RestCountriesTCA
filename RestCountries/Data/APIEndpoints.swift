//
//  APIEndpoints.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import Foundation

struct APIEndpoints {
    static func getCountries(requestDTO: CountriesRequestDTO) -> Endpoint<[CountryResponseDTO]> {
        return Endpoint(path: "all", method: .get, queryParametersEncodable: requestDTO)
    }
}
