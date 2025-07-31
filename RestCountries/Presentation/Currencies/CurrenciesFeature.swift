//
//  CurrenciesFeature.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import ComposableArchitecture

@Reducer
struct CurrenciesFeature {
    
    @ObservableState
    struct State: Equatable {
        var currencies: [Currencies]
    }
    
    enum Action {
        case loadCurrencies
        case currenciesLoaded([Currencies])
    }
    
    @Dependency(\.countriesRepository) var countriesRepository
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .loadCurrencies:
                return .run { send in
                    do {
                        let currencies = try await countriesRepository.fetchCurrencies(fields: "currencies")
                        await send(.currenciesLoaded(currencies))
                    } catch let error {
                        print(error)
                    }
                }
                
            case let .currenciesLoaded(currencies):
                state.currencies = currencies
                print("Currencies: \(currencies)")
                print("State currencies: \(state.currencies)")
                return .none
                
            }
        }
    }
    
}
