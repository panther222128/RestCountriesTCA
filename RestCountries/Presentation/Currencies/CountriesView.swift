//
//  CountriesView.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import SwiftUI
import ComposableArchitecture

struct CountriesView: View {
    
    let store: StoreOf<CountriesFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Button {
                    viewStore.send(.loadCountries)
                } label: {
                    Text("Load countries")
                }
                List(viewStore.countries) { country in
                    Text("\(country.name.common)")
                }
            }
        }
    }
    
}
