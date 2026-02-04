//
//  GalleryView.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 1/31/26.
//

import SwiftUI

struct GalleryView: View {
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 100)), count: 2)
    
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                Rectangle()
                    .frame(height: 180)
                    .cornerRadius(10)
                    .foregroundStyle(Color.blue)
                
                Rectangle()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .foregroundStyle(Color.red)
                
                Rectangle()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .foregroundStyle(Color.red)
                
                Rectangle()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .foregroundStyle(Color.red)
            }
        }
        
    }
}

#Preview {
    GalleryView()
}
