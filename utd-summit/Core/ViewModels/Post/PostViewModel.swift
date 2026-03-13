//
//  PostViewModel.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/22/26.
//

import Foundation

@Observable
@MainActor
class PostViewModel {
    
    // MARK: - States
    var posts: [PostItem]?
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let postService: PostService
    init(postService: PostService? = nil) {
        self.postService = postService ?? .PostServiceShared
    }
    
    // MARK: - VM Functions
    
    func getPosts(status: PostStatus?, type: PostType?, limit: Int?) async {
        self.isLoading = true
        let result = await postService.getPosts(status: status, type: type, limit: limit)
        
        switch result {
        case .success(let posts):
            self.posts = posts
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
        
        self.isLoading = false
    }
    
    func getPostById(id: UUID, status: PostStatus?, type: PostType?) async {
        
        self.isLoading = true
        let result = await postService.getPostById(userId: id, status: status, type: type)
        
        switch result {
        case .success(let posts):
            self.posts = posts
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
        
        self.isLoading = false
    }
    
        
}
