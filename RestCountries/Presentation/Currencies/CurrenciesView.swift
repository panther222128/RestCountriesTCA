//
//  CurrenciesView.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import SwiftUI
import ComposableArchitecture

struct CurrenciesView: View {
    
    let store: StoreOf<CurrenciesFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Button {
                    viewStore.send(.loadCurrencies)
                } label: {
                    Text("Load currencies")
                }
                List(viewStore.currencies) { currencies in
                    Text("\(currencies.currencies)")
                }
            }
        }
    }
    
}
