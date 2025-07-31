//
//  Dependencies.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import Foundation
import ComposableArchitecture

enum CountriesRepositoryKey: DependencyKey {
    static var liveValue: CountriesRepository {
        lazy var apiBaseURL: URL = {
            guard let urlString = Bundle.main.infoDictionary?["API_BASE_URL"] as? String else {
                fatalError("URL Error")
            }
            return URL(string: urlString)!
        }()
        let repository = DefaultCountriesRepository(dataTransferService: DefaultDataTransferService(with: DefaultNetworkService(configuration: ApiDataNetworkConfig(baseURL: apiBaseURL))))
        return repository
    }
}

extension DependencyValues {
    var countriesRepository: CountriesRepository {
        get { self[CountriesRepositoryKey.self] }
        set { self[CountriesRepositoryKey.self] = newValue }
    }
}
