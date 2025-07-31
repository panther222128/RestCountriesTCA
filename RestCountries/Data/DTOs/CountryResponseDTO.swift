//
//  CountryResponseDTO.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import Foundation

struct CountryResponseDTO: Decodable {
    let name: NameResponseDTO
}

extension CountryResponseDTO {
    func toDomain() -> Country {
        return .init(name: name.toDomain())
    }
}

struct NameResponseDTO: Decodable {
    let common: String
    let official: String
}

extension NameResponseDTO {
    func toDomain() -> Name {
        return .init(common: common, official: official)
    }
}
