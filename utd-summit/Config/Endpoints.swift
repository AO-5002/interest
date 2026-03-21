//
//  Endpoints.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/22/26.
//

import Foundation

enum APIEndpoints {
    
    private static let baseURL = "http://localhost:8080"
    private static let baseS3URL = ""
    
    enum Media {
        static let baseS3 = baseS3URL
        static let banner = "/\(baseS3URL)/banner"
        static let profile = "/\(baseS3URL)/profile"
    }
    
    // MARK: - User
    
    enum User {
        static let base = "\(baseURL)/users"
        static func byId(_ id: String) -> String { "\(base)/\(id)" }
    }
    
    // MARK: - Post
    
    enum Post {
        static let base = "\(baseURL)/posts"
        static func general(type: PostType? = nil, status: PostStatus? = nil, limit: Int? = 5) -> String {
            var url = base
            var params: [String] = []
            
            if let type = type {
                params.append("type=\(type.rawValue)")
            }
            
            if let status = status {
                params.append("status=\(status.rawValue)")
            }
            
            if let limit = limit {
                params.append("limit=\(limit)")
            }
            
            if !params.isEmpty {
                url += "?" + params.joined(separator: "&")
            }
            
            return url
        }
        
        static func byId(_ userId: String, type: PostType? = nil, status: PostStatus? = nil) -> String {
            var url = "\(base)/\(userId)"
            var params: [String] = []
            
            if let type = type {
                params.append("type=\(type.rawValue)")
            }
            if let status = status {
                params.append("status=\(status.rawValue)")
            }
            if !params.isEmpty {
                url += "?" + params.joined(separator: "&")
            }
            
            return url
        }
    }
    
    // MARK: - Profile
    
    enum Profile {
        static let base = "\(baseURL)/profiles"
        static func byId(_ id: String) -> String { "\(base)/\(id)" }
    }
}
