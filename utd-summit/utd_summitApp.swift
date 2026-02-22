//
//  utd_summitApp.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 1/29/26.
//

import SwiftUI

@main
struct utd_summitApp: App {
    @State private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(authViewModel)
                .task {
                    await authViewModel.getInitialSession()
                }
        }
    }
}

struct RootView: View {
    @Environment(AuthViewModel.self) private var authViewModel
    
    var body: some View {
        if authViewModel.isLoading {
            ProgressView()
        } else if authViewModel.isAuthenticated {
            ContentView()
        } else {
            AuthView()
        }
    }
}
