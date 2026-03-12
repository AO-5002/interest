//
//  UserService.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/18/26.
//

import Foundation
import Supabase

class UserService {
    
    static let UserServiceShared = UserService()
    
    let networkManager: NetworkManager
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    // MARK: - Create the User
    
    func createUser(session: Session, name: String) async throws -> Void {
        let dto = CreateUserDto(
            authId: session.user.id.uuidString,
            name: name,
            email: session.user.email ?? ""
        )
        
        do {
            try await networkManager.post(url: APIEndpoints.User.base, body: dto)
        }
        catch {
            throw UserServiceError.userCreationFailed
        }
    }
    
    // MARK: - Return User Profile
    
    func getUserProfile(authId: String) async throws -> User {
        guard !authId.isEmpty else {
            throw UserServiceError.invalidAuthId
        }
        
        do {
            return try await networkManager.get(url: APIEndpoints.User.byId(authId))
        } catch {
            throw UserServiceError.userNotFound
        }
    }
    
}
