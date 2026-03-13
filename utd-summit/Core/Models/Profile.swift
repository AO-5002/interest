//
//  Profile.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/22/26.
//

import Foundation


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

struct ProfileBannerMedia: Codable, Identifiable, Hashable {
    let id: UUID
    let profileId: UUID
    let s3Key: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case profileId
        case s3Key = "s3_key"
    }
}

// MARK: - Profile Summary

struct ProfileSummary: Codable, Identifiable, Hashable {
    let id: UUID
    let handle: String
    let name: String
    let avatar: ProfileMedia?
    let banner: ProfileBannerMedia?
}
