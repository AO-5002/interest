//
//  ProfileError.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 3/10/26.
//

import Foundation

enum ProfileServiceError: LocalizedError {
    
    // SELF
    case failedToFetchProfile
    
    // EXTERNAL
    case profileIsBlocked
    
    var errorDescription: String? {
        switch self {
        case .failedToFetchProfile:
            return "Failed to fetch profile."
        case .profileIsBlocked:
            return "Profile is blocked."
        }
    }
    
}
