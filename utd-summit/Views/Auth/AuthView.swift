//
//  AuthView.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/1/26.
//

import SwiftUI

// Main View Below

public struct AuthView: View {
    
    @State var authViewModel = AuthViewModel()
    
    public var body: some View {
        ZStack {
            // Background gradient
//            LinearGradient(
//                colors: [.blue.opacity(0.3), .purple.opacity(0.3)],
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//            .ignoresSafeArea()
            
            // Content
            VStack(spacing: 24) {
                Spacer()
                    .frame(height: 164)
                BrandingView(text: "Build and Inspire")
                AuthPhoneView(authViewModel: authViewModel)
                DividerWithText(text: "or")
                MediaAuthView()
                Spacer()
            }
            .padding()
        }
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
                .padding(.horizontal, 8)
            
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(height: 1)
        }
    }
}

public struct MediaAuthView: View {
    
    public var body: some View {
        VStack(spacing: 12) {
            ButtonView(systemImage: "apple.logo")
            ButtonView(assetImage: "googleIcon")
        }
    }
}

public struct ButtonView: View {
    var text: String?
    var systemImage: String?      // For SF Symbols
    var assetImage: String?        // For Assets.xcassets
    var action: (() async -> Void)?
    
    public var body: some View {
        Button {
            Task {
                await action?()
            }
        } label: {
            Group {
                if let text = text {
                    Text(text)
                } else if let systemImage = systemImage {
                    Image(systemName: systemImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                } else if let assetImage = assetImage {
                    Image(assetImage)  // From Assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                } else {
                    EmptyView()
                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 64)
        .foregroundStyle(.white)
        .fontWeight(.bold)
        .background(.black)
        .cornerRadius(12)
    }
}

#Preview {
    AuthView()
}
