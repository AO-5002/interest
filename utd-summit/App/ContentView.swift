import SwiftUI

enum Tabs {
    case Home, Upload, Profile, Search
}

struct ContentView: View {
    
    @State private var selectedTab: Tabs = .Home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house.fill", value: Tabs.Home) {
                HomeView()
            }
            Tab("Upload", systemImage: "plus", value: Tabs.Upload){
                UploadView()
            }
            Tab("Profile", systemImage: "person.fill", value: Tabs.Profile) {
                ProfileView()
            }
            Tab(value: Tabs.Search, role: .search) {
                Color.blue.ignoresSafeArea()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(AuthViewModel())
}
