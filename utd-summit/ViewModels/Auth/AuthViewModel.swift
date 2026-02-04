//
//  AuthViewModel.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 1/29/26.
//

import SwiftUI
import Supabase
import Combine

@Observable
@MainActor
class AuthViewModel {
    var session: Session?
    var isAuthenticated = false
    
    func getInitialSession() async {
        do {
            let current = try await client.auth.session
            self.session = current
            self.isAuthenticated = current != nil
        } catch {
            print("No active session")
        }
    }
    
    func signOut() async {
        do {
            try await client.auth.signOut()
            self.session = nil
            self.isAuthenticated = false
        } catch {
            print("Sign out failed.")
        }
    }
    
    func sendPhoneOTP(phone: String) async {
        do {
            try await client.auth.signInWithOTP(
                phone: "+18557066315"
            )
        } catch {
            print("Phone number does not exist.")
        }
    }
    
    func verifyPhoneOTP(phone: String, token: String) async {
        do {
            try await client.auth.verifyOTP(
                phone: phone, token: token, type: .sms
            )
        } catch {
            print("Invalid code.")
        }
    }
    
//    func updatePhoneNumber(newNumber: String) async {
//        do {
//            try await client.auth.update(user: <#T##UserAttributes#>(
//                phone: newNumber
//            ))
//        } catch {
//            print("Error updating phone number, try again later!")
//        }
//     }
}
