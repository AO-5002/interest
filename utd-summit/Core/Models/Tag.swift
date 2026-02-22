//
//  Tag.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/21/26.
//

import Foundation

struct Tag: Codable, Identifiable {
    let id: UUID
    let name: String
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case createdAt = "created_at"
    }
}
