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
        @Dependency(\.dataTransferService) var dataTransferService
        return DefaultCountriesRepository(dataTransferService: dataTransferService)
    }
}

extension DependencyValues {
    var countriesRepository: CountriesRepository {
        get { self[CountriesRepositoryKey.self] }
        set { self[CountriesRepositoryKey.self] = newValue }
    }
}

enum DataTransferServiceKey: DependencyKey {
    static var liveValue: DataTransferService {
        @Dependency(\.networkService) var networkService
        return DefaultDataTransferService(with: networkService)
    }
}

extension DependencyValues {
    var dataTransferService: DataTransferService {
        get { self[DataTransferServiceKey.self] }
        set { self[DataTransferServiceKey.self] = newValue }
    }
}

enum NetworkServiceKey: DependencyKey {
    static var liveValue: NetworkService {
        let apiBaseURL = URL(string: Bundle.main.infoDictionary?["API_BASE_URL"] as? String ?? "")!
        let config = ApiDataNetworkConfig(baseURL: apiBaseURL)
        let networkService = DefaultNetworkService(configuration: config)
        return networkService
    }
}

extension DependencyValues {
    var networkService: NetworkService {
        get { self[NetworkServiceKey.self] }
        set { self[NetworkServiceKey.self] = newValue }
    }
}
