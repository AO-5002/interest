//
//  PostService.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/18/26.
//

import Foundation

class PostService {
    
    static let PostServiceShared = PostService()
    
    let networkManager: NetworkManager
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    // MARK: - General Polished Post Feed (~ 10)
    
    func getPosts(status: PostStatus?, type: PostType?, limit: Int?) async -> Result<[PostItem], PostServiceError> {
        
        do {
            let posts: [PostItem] = try await networkManager.get(url: APIEndpoints.Post.general(type: type, status: status, limit: limit))
            return .success(posts)
        }
        catch {
            return .failure(.failedToFetchPosts)
        }
    }
    
    // MARK: - Get Posts (optionally with PostStatus)
    
    func getPostById(userId: UUID, status: PostStatus?, type: PostType?) async -> Result<[PostItem], PostServiceError> {
        
        do {
            let posts: [PostItem] = try await networkManager.get(url: APIEndpoints.Post.byId(userId.uuidString, type: type, status: status))
            return .success(posts)
        }
        catch {
            return .failure(PostServiceError.failedToFetchPosts)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}

