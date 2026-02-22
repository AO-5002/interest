//
//  AuthView.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/1/26.
//

import SwiftUI
import AuthenticationServices
import Supabase
import Auth

public struct AuthView: View {
    
    @Environment(AuthViewModel.self) private var authViewModel
    
    public var body: some View {
        VStack(spacing: 24) {
            Spacer()
                .frame(height: 164)
            
            BrandingView(text: "Build and Inspire")
            DividerWithText(text: "Continue with")
            AuthProviderView(authViewModel: authViewModel)
            
            Spacer()
        }
        .padding()
    }
}

// Supporting Views Below

public struct BrandingView: View {
    
    public var text: String
    
    public var body: some View {
        VStack(spacing: 36) {
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 36, height: 36)
            
            Text(text)
                .font(.title2)
                .fontWeight(.bold)
        }
    }
}

public struct DividerWithText: View {
    var text: String
    
    public var body: some View {
        HStack {
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(height: 1)
            
            Text(text)
                .foregroundStyle(.gray)
                .padding(.horizontal, 2)
            
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(height: 1)
        }
    }
}

public struct AuthProviderView: View {
    
    let authViewModel: AuthViewModel
    
    public var body: some View {
        VStack(spacing: 12) {
            AppleLogin(authViewModel: authViewModel)
        }
    }
}

public struct AppleLogin: View {
    let authViewModel: AuthViewModel
    
    public var body: some View {
        ZStack {
            // The functional Apple button (invisible)
            SignInWithAppleButton { request in
                request.requestedScopes = [.email, .fullName]
            } onCompletion: { result in
                Task {
                    await authViewModel.handleAppleSignIn(result)
                }
            }
            .signInWithAppleButtonStyle(.black)
            .frame(height: 64)
            .opacity(0.001)
            
            HStack {
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 64)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .background(.black)
            .cornerRadius(12)
            .allowsHitTesting(false)
        }
        .frame(height: 64)  // Constrain the ZStack itself
    }
}

#Preview {
    AuthView()
        .environment(AuthViewModel())
}
