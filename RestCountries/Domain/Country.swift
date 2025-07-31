//
//  Countries.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import Foundation

struct Country: Equatable, Identifiable {
    let id: String = UUID().uuidString
    let name: Name
}

struct Name: Equatable {
    let common: String
    let official: String
}
