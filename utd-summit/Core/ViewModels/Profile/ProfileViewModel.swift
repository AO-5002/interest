//
//  ProfileViewModel.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 3/10/26.
//

import Foundation

@Observable
@MainActor
class ProfileViewModel {
    
    // MARK: - States
    var profile: ProfileSummary?
    var errorMessage: String?
    var isLoading: Bool = false
    
    // MARK: - ProfileService Injection
    
    private let profileService: ProfileService
    init(profileService: ProfileService? = nil) {
        self.profileService = profileService ?? .ProfileServiceShared
    }
    
    // MARK: - VM Functions
    
    func getProfileById(id: UUID) async {
        self.isLoading = true
        let result = await profileService.returnProfile(id: id)
        
        switch result {
        case .success(let profile):
            self.profile = profile
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
        
        self.isLoading = false
    }
    
}
