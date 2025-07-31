//
//  CountriesFeature.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import ComposableArchitecture

@Reducer
struct CountriesFeature {
    
    @ObservableState
    struct State: Equatable {
        var countries: [Country]
    }
    
    enum Action {
        case loadCountries
        case countriesLoaded([Country])
    }
    
    @Dependency(\.countriesRepository) var countriesRepository
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .loadCountries:
                return .run { send in
                    do {
                        let countries = try await countriesRepository.fetchCountries(fields: "name")
                        await send(.countriesLoaded(countries))
                    } catch let error {
                        print(error)
                    }
                }
                
            case let .countriesLoaded(countries):
                state.countries = countries
                return .none
                
            }
        }
    }
    
}
