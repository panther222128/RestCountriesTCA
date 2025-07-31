//
//  CountriesRepository.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

protocol CountriesRepository {
    func fetchCurrencies(fields: String) async throws -> [Currencies]
}

final class DefaultCountriesRepository: CountriesRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
    func fetchCurrencies(fields: String) async throws -> [Currencies] {
        let endpoint = APIEndpoints.getCurrencies(requestDTO: .init(fields: fields))
        do {
            let response = try await dataTransferService.request(with: endpoint)
            let domain = response.map { $0.toDomain() }
            return domain
        } catch let error {
            throw error
        }
    }
    
}
