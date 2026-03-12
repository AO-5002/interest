//
//  AuthViewModel.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 1/29/26.
//

import SwiftUI
import Supabase
import Combine
import AuthenticationServices

@Observable
@MainActor
class AuthViewModel {
    var session: Session?
    var isAuthenticated = false
    var errorMessage: String?
    var isLoading: Bool = true
    
    // MARK: General Authentication Functionality
    
    func getInitialSession() async {
        do {
            let current = try await client.auth.session
            self.session = current
            self.isAuthenticated = true
            isLoading.toggle()
        } catch {
            print("No active session")
            self.isAuthenticated = false
            isLoading.toggle()
        }
    }
    
    func signOut() async {
        do {
            try await client.auth.signOut()
            self.session = nil
            self.isAuthenticated = false
        } catch {
            print("Sign out failed: \(error.localizedDescription)")
        }
    }
    
    // MARK: Apple-Authentication-Provider
    
    func handleAppleSignIn(_ result: Result<ASAuthorization, Error>) async {
        do {
            guard let credential = try result.get().credential as? ASAuthorizationAppleIDCredential else {
                errorMessage = "Failed to get credential"
                return
            }
            
            guard let idToken = credential.identityToken.flatMap({ String(data: $0, encoding: .utf8) }) else {
                errorMessage = "Failed to get idToken"
                return
            }
            
            // Capture name on first sign in only
            let fullName = [
                credential.fullName?.givenName,
                credential.fullName?.familyName
            ]
            .compactMap { $0 }
            .joined(separator: " ")
            
            try await client.auth.signInWithIdToken(
                credentials: .init(
                    provider: .apple,
                    idToken: idToken
                )
            )
            
            // UPDATE SESSION
            let current = try await client.auth.session
            self.session = current
            self.isAuthenticated = true
            
            // CREATE USER IN DB
            try await UserService.UserServiceShared.createUser(session: current, name: fullName)
            
        } catch {
            errorMessage = "Error: \(error.localizedDescription)"
        }
    }
    
    // MARK: Google-Authentication-Provider
    
    func handleGoogleSignIn(_ result: Result<ASAuthorization, Error>) async {}
}
