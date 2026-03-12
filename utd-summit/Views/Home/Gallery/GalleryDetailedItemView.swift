//
//  GalleryDetailedItemView.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/21/26.
//

import SwiftUI

struct GalleryDetailedItemView: View {
    
    @State private var showSheet: Bool = false
    @State private var selectedDetent: PresentationDetent = .fraction(0.40)
    
    var isFullyExpanded: Bool {
        selectedDetent == .large
    }

    
    private var data: PostItem = dummyPostItems[0]
    
    var body: some View {
        ZStack {
            
            // Background Image of Content
            Color.blue.ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                DragSheetZone(showSheet: $showSheet)
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .sheet(isPresented: $showSheet, ) {
            SheetView(data: data, selectedDetent: selectedDetent)
                .presentationDetents([.fraction(0.40), .large], selection: $selectedDetent)
        }
    }
}

struct DragSheetZone: View {
    @Binding var showSheet: Bool
    
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .contentShape(Rectangle())
            .frame(maxWidth: .infinity, maxHeight: 250)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.height < -30 { // swiped up
                            showSheet = true
                        }
                    }
            )
    }
}


struct SheetView: View {
    
    let data: PostItem
    let selectedDetent: PresentationDetent
    
    var body: some View {
        VStack(spacing: 12) {
            
            if selectedDetent == .large {
                CompleteSheetView()
            }
            else {
                // Time + (Save & Repost)
                HStack {
                    Text("5h Ago")
                        .font(.caption)
                    
                    Spacer()
                    HStack {
                        Image(systemName: "bookmark")
                            .font(.caption)
                    }
                }
                
                // Title
                HStack {
                    Text("\(data.content.title)")
                        .font(.largeTitle)
                        .fontWeight(.light)
                    
                    Spacer()
                }
                
                // Profile Pic
                HStack {
                    AsyncImage(url: URL(string: "")) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 48, height: 48)
                                .clipped()
                        case .failure:
                            Image(systemName: "photo")
                                .frame(width: 48, height: 48)
                        default:
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 48, height: 48)
                                .cornerRadius(12)
                        }
                    }
                    
                    // Name + (Follow)
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("\(data.profile.handle)")
                            .font(.default)
                        Text("Follow")
                            .font(.caption2)
                            .underline()
                            .foregroundStyle(.primary.opacity(0.8))
                        
                    }
                    
                    Spacer()
                }
                
                // Abstract Section
                VStack(alignment: .leading, spacing: 4) {
                    Text("Abstract")
                        .font(.default)
                        .fontWeight(.bold)
                    
                    Text("\(data.content.abstractContent)")
                        .font(.caption)
                        .foregroundStyle(.primary.opacity(0.8))
                }
                
                // Tag Section
                HStack(spacing: 4) {
                    ForEach(data.tags, id: \.id) { tag in
                        Text("#\(tag.name)")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundStyle(.primary.opacity(0.8))
                    }
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .padding(24)
    }
}

struct CompleteSheetView: View {
    var body: some View {
        Text("Complete View")
    }
}

#Preview {
    GalleryDetailedItemView()
}
