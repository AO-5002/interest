import SwiftUI
import Foundation
import Supabase

// MARK: - Selection Type

enum SelectionType: String, Codable, CaseIterable {
    case polished = "Polished"
    case projects = "Projects"
    case saved = "Saved"
}

// MARK: - Profile View

struct ProfileView: View {
    
    @Environment(AuthViewModel.self) private var authViewModel
    @State private var pvm: ProfileViewModel = ProfileViewModel()
    @State private var postvm: PostViewModel = PostViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    ProfileBannerView(pvm: pvm)
                    ProfileIconView(pvm: pvm)
                        .offset(x: 16, y: 40)
                }
                
                VStack(spacing: 24) {
                    ProfileBioView(pvm: pvm)
                    SelectionView(postViewModel: postvm, profileId: pvm.profile?.id)
                }
                .padding(.top, 50)
                
                Spacer()
            }
        }
        
        .ignoresSafeArea(edges: .top)
        .task {
            guard ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" else { return }
            if let session = authViewModel.session {
                await pvm.getProfileById(id: session.user.id)
            }
        }
    }
}

// MARK: - Banner

struct ProfileBannerView: View {
    
    let pvm: ProfileViewModel
    
    var body: some View {
        if pvm.isLoading {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(maxWidth: .infinity, maxHeight: 256)
        } else {
            let bannerURL = pvm.profile?.banner?.s3Key
                .flatMap { URL(string: "https://your-bucket.s3.amazonaws.com/\($0)") }
            
            AsyncImage(url: bannerURL) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFill()
                default:
                    Image("DefaultBanner").resizable().scaledToFill()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 256)
            .clipped()
        }
    }
}

// MARK: - Icon

struct ProfileIconView: View {
    
    let pvm: ProfileViewModel
    var dimension: CGFloat = 108
    
    var body: some View {
        if pvm.isLoading {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: dimension, height: dimension)
                .cornerRadius(12)
        } else {
            let avatarURL = pvm.profile?.avatar?.s3Key
                .flatMap { URL(string: "https://your-bucket.s3.amazonaws.com/\($0)") }
            
            AsyncImage(url: avatarURL) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFill()
                default:
                    DefaultProfileIcon(name: pvm.profile?.handle)
                }
            }
            .frame(width: dimension, height: dimension)
            .cornerRadius(12)
            .clipped()
        }
    }
}

// MARK: - Bio

struct ProfileBioView: View {
    
    let pvm: ProfileViewModel
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading) {
                if let profile = pvm.profile {
                    Text(profile.name)
                        .font(.headline)
                    Text("@\(profile.handle)")
                        .foregroundStyle(.primary.opacity(0.4))
                        .font(.caption)
                }
                else {
                    Text("Jane Doe")
                        .font(.headline)
                    
                    Text("@janedoe223")
                        .foregroundStyle(.primary.opacity(0.4))
                        .font(.caption)
                }
            }
            
            Spacer()
            
            Button {
                // settings
            } label: {
                Image(systemName: "gearshape")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

// MARK: - Selection

struct SelectionView: View {
    
    @State private var selected: SelectionType = .polished
    let postViewModel: PostViewModel
    let profileId: UUID?
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                ForEach(SelectionType.allCases, id: \.self) { type in
                    Button {
                        selected = type
                    } label: {
                        Text(type.rawValue)
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .fontWeight(selected == type ? .bold : .regular)
                    }
                    .foregroundStyle(.primary)
                }
            }
            
            Divider()
            
            LoadPostsView(selection: selected, postViewModel: postViewModel, profileId: profileId)
        }
    }
}

// MARK: - Load Posts

struct LoadPostsView: View {
    
    let selection: SelectionType
    let postViewModel: PostViewModel
    let profileId: UUID?
    
    var body: some View {
        Group {
            if postViewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, minHeight: 200)
            } else if let error = postViewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, minHeight: 200)
            } else if let posts = postViewModel.posts, !posts.isEmpty {
                LazyVStack {
                    ForEach(posts) { post in
                        Text(post.title)
                            .padding()
                    }
                }
            } else {
                Text("No posts yet.")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, minHeight: 200)
            }
        }
        .task(id: selection) {
            guard let profileId else { return }
            switch selection {
            case .polished:
                await postViewModel.getPostById(id: profileId, status: .polished, type: nil)
            case .projects:
                await postViewModel.getPostById(id: profileId, status: .rough, type: nil)
            case .saved:
                await postViewModel.getPosts(status: nil, type: nil, limit: 10)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ProfileView()
        .environment(AuthViewModel())
}
