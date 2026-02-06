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
    
    func getInitialSession() async {
        do {
            let current = try await client.auth.session
            self.session = current
            self.isAuthenticated = true
        } catch {
            print("No active session")
            self.isAuthenticated = false
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
    
    func handleAppleSignIn(_ result: Result<ASAuthorization, Error>) async {
        print("🔵 handleAppleSignIn called")
        
        do {
            print("🔵 Getting credential...")
            guard let credential = try result.get().credential as? ASAuthorizationAppleIDCredential else {
                print("🔴 Failed to get credential")
                return
            }
            
            print("🔵 Got credential, extracting token...")
            guard let idToken = credential.identityToken.flatMap({ String(data: $0, encoding: .utf8) }) else {
                print("🔴 Failed to get idToken")
                return
            }
            
            print("🔵 Got token, signing in to Supabase...")
            try await client.auth.signInWithIdToken(
                credentials: .init(
                    provider: .apple,
                    idToken: idToken
                )
            )
            
            print("🟢 Supabase sign in successful!")
            
            // rest of your code...
            
        } catch {
            print("🔴 Error: \(error)")
            print("🔴 Error description: \(error.localizedDescription)")
        }
    }
    
    
}
