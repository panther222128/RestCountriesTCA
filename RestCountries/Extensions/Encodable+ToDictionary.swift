//
//  Encodable+ToDictionary.swift
//  RestCountries
//
//  Created by Horus on 7/31/25.
//

import Foundation

extension Encodable {
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let jsonData = try JSONSerialization.jsonObject(with: data)
        return jsonData as? [String : Any]
    }
}
