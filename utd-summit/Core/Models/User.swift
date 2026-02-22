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

// MARK: - Profile

struct Profile: Codable, Identifiable, Hashable {
    let id: UUID
    let bio: String?
    let createdAt: String
    let updatedAt: String
    let userId: UUID

    enum CodingKeys: String, CodingKey {
        case id
        case bio
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case userId = "user_id"
    }
}

// MARK: - Profile Media (Profile Picture)

struct ProfileMedia: Codable, Identifiable, Hashable {
    let id: UUID
    let profileId: UUID
    let s3Key: String?

    enum CodingKeys: String, CodingKey {
        case id
        case profileId = "profile_id"
        case s3Key = "s3_key"
    }
}

// MARK: - Profile Summary

struct ProfileSummary: Identifiable, Hashable {
    let id: UUID
    let handle: String
    let name: String
    let avatar: ProfileMedia?
}
