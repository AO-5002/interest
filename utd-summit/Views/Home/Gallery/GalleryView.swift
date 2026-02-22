import SwiftUI

struct GalleryView: View {
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 100)), count: 2)
    
    public var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(dummyPostItems) { post in
                            NavigationLink(value: post) {
                                GalleryContentItem(item: post, itemHeight: geometry.size.height / 2)
                            }
                        }
                    }
                }
                .navigationTitle("Gallery")
                .navigationDestination(for: PostItem.self) { value in
                    GalleryDetailedItemView()
                }
            }
        }
    }
}

struct GalleryContentItem: View {
    
    let item: PostItem
    let itemHeight: CGFloat
    
    var thumbnailURL: URL? {
        guard let s3Key = item.thumbnail?.s3Key else { return nil }
        
        return URL(string: "https://your-bucket.s3.amazonaws.com/\(s3Key)")
    }
    
    var body: some View {
        AsyncImage(url: thumbnailURL) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Rectangle()
                .foregroundStyle(.gray.opacity(0.3))
        }
        .frame(maxWidth: .infinity, minHeight: itemHeight)
        .clipped()
        .cornerRadius(12)
    }
}

// MARK: Preview Overlay (TBD)
// DO LATER

struct PreviewOverlayView: View {
    
    var itemTitle: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
            
            VStack(alignment: .leading) {
                Text(itemTitle)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    GalleryView()
}
