//
//  ProfileService.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 3/10/26.
//

import Foundation
import Supabase
import Combine

class ProfileService {
    
    static let ProfileServiceShared = ProfileService()
    
    let networkManager: NetworkManager
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    // MARK: - (SELF) Return Profile
    
    func returnProfile(id: UUID) async -> Result<ProfileSummary, ProfileServiceError> {
        do {
            let profile: ProfileSummary = try await networkManager.get(url: APIEndpoints.Profile.byId(id.uuidString))
            return .success(profile)
        } catch {
            return .failure(.failedToFetchProfile)
        }
    }
    
    // MARK: - Return Other Profile (external)
    
    
    
    
    
    
    
}
