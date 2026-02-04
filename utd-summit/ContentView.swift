//
//  ContentView.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 1/29/26.
//

import SwiftUI

enum Tabs {
    case Home, Feed, Profile, Search
}


struct ContentView: View {
    
    @State private var selectedTab: Tabs = .Home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house.fill", value: Tabs.Home){
                HomeView()
            }
            Tab("Feed", systemImage: "heart.fill", value: Tabs.Feed){
                FeedView()
            }
            Tab("Profile", systemImage: "person.fill", value: Tabs.Profile){
                ProfileView()
            }
            Tab(value: Tabs.Search, role: .search) {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
