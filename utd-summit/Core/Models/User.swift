import Foundation

// MARK: - User

struct User: Codable, Identifiable, Hashable {
    let id: UUID
    let authId: String
    let name: String
    let email: String
    let birthday: String?
    let createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case authId = "auth_id"
        case name
        case email
        case birthday
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct CreateUserDto: Codable {
    let authId: String
    let name: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case authId = "auth_id"
        case name
        case email
    }
}
