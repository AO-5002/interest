//
//  GalleryView.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 1/31/26.
//

import SwiftUI

struct GalleryView: View {
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 100)), count: 2)
    @State var isTapped: Bool = false

    
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    Rectangle()
                        .frame(height: geometry.size.height / 2)
                        .foregroundStyle(isTapped ? Color.green : Color.red)
                        .cornerRadius(10)
                        .onTapGesture {
                            isTapped.toggle()
                        }
                }
                .padding()
            }
        }
    }
}

struct GalleryContentItem: View {
    var body: some View {
        
        @State var isPressed: Bool = false
        @State var isTapped: Bool = false
        
        
        
    }
}

#Preview {
    GalleryView()
}
