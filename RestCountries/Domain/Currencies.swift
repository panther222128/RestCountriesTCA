//
//  Currencies.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import Foundation

struct Currencies: Equatable, Identifiable {
    let id: String = UUID().uuidString
    let currencies: [String: Currency]
}

struct Currency: Equatable, Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let symbol: String
}
