//
//  RestCountriesApp.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import SwiftUI
import ComposableArchitecture

@main
struct RestCountriesApp: App {
    static let countriesStore = Store(initialState: CountriesFeature.State(countries: [])) {
        CountriesFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            CountriesView(store: RestCountriesApp.countriesStore)
        }
    }
}
