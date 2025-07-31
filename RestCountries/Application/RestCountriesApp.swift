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
    static let currenciesStore = Store(initialState: CurrenciesFeature.State(currencies: [])) { 
        CurrenciesFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            CurrenciesView(store: RestCountriesApp.currenciesStore)
        }
    }
}
