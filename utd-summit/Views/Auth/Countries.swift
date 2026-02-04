//
//  Countries.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/1/26.
//

import Foundation

struct Country: Codable, Hashable {
    var name: String
    var dialCode: String
    var isoCode: String
    var flag: String {
        isoCode.unicodeScalars.reduce(into: "") {
            if let scalar = UnicodeScalar(127397 + $1.value) {
                $0.unicodeScalars.append(scalar)
            }
        }
    }
    
    static let list: [Country] = {
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let countries = try? JSONDecoder().decode([Country].self, from: data)
        else {
            return []
        }
        return countries
    }()
}
