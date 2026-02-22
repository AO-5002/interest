import Foundation

// MARK: - Enums

enum PostType: String, Codable, Hashable {
    case rough = "ROUGH"
    case polished = "POLISHED"
}

// MARK: - Post

struct Post: Codable, Identifiable, Hashable {
    let id: UUID
    let title: String
    let type: PostType
    let createdAt: String
    let updatedAt: String
    let profileId: UUID

    enum CodingKeys: String, CodingKey {
        case id
        case title
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

// MARK: - Post Tag

struct PostTag: Codable, Hashable {
    let postId: UUID
    let tagId: UUID
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case postId = "post_id"
        case tagId = "tag_id"
        case createdAt = "created_at"
    }
}

// MARK: - Post View Model (Combined)

struct PostItem: Identifiable, Hashable {
    let id: UUID
    let content: Post
    let thumbnail: PostMedia?
    let tags: [PostTag]
    let profile: ProfileSummary
}
