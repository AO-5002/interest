//
//  UserError.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/22/26.
//

import Foundation

enum UserServiceError: LocalizedError {
    
    // Existence checks
    case userNotFound
    case userAlreadyExists
    
    // Authorization
    case userUnauthorized
    case invalidAuthId
    
    // Creation
    case userCreationFailed
    case invalidUserData
    
    var errorDescription: String? {
        switch self {
        case .userNotFound:
            return "User does not exist"
        case .userAlreadyExists:
            return "User already exists"
        case .userUnauthorized:
            return "User is not authorized"
        case .userCreationFailed:
            return "Failed to create user"
        case .invalidAuthId:
            return "Invalid authId"
        case .invalidUserData:
            return "Invalid user data provided"
        }
    }
}
