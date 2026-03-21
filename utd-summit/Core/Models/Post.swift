import Foundation

// MARK: - Enums

enum PostStatus: String, Codable, Hashable {
    case rough = "ROUGH"
    case polished = "POLISHED"
}

enum PostType: String, Codable, Hashable {
    case music = "MUSIC"
    case video = "VIDEO"
    case picture = "PICTURE"
}

// MARK: - Post

struct Post: Codable, Identifiable, Hashable {
    let id: UUID
    let title: String
    let abstractContent: String
    let type: PostType
    let createdAt: String
    let updatedAt: String
    let profileId: UUID

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case abstractContent = "abstract_content"
        case type
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case profileId = "profile_id"
    }
}

// MARK: - Post Media (Thumbnail)

struct PostMedia: Codable, Identifiable, Hashable {
    let id: UUID
    let postId: UUID
    let s3Key: String

    enum CodingKeys: String, CodingKey {
        case id
        case postId = "post_id"
        case s3Key = "s3_key"
    }
}

// MARK: - Tag

struct Tag: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case createdAt = "created_at"
    }
}

// MARK: - Post View Model (Combined)

struct PostItem: Codable, Identifiable, Hashable {
    let id: UUID
    let title: String
    let abstractContent: String
    let type: PostType
    let thumbnailS3Key: String?
    let tags: [String]          
    let profile: ProfileSummary
}
