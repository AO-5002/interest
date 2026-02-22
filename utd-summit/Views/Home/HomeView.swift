import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            GalleryView()
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
