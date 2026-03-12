//
//  PostError.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 3/10/26.
//

import Foundation

enum PostServiceError: LocalizedError {
    
    case failedToFetchPosts
    
    var errorDescription: String? {
        switch self {
        case .failedToFetchPosts:
            return "Failed to fetch your posts."
        default:
            return "Unknown error while returning your posts."
        }
    }
    
}
