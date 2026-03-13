import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            NavigationStack {
                
                
                GalleryView()
            }
        }
    }
}

#Preview {
    HomeView()
}
