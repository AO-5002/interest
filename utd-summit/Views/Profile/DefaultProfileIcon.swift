//
//  DefaultProfileIcon.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 3/12/26.
//

import SwiftUI
import Foundation

struct DefaultProfileIcon: View {
    
    var dimension: CGFloat? = 108
    var name: String?
    
    var body: some View {
        
        Rectangle()
            .fill(Gradient(colors: [.green, .mint]))
            .frame(width: dimension, height: dimension)
            .overlay{
                if let initial = name?.first {
                    Text(String(initial).uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
            }
    }
}

#Preview {
    DefaultProfileIcon(name: "Bob")
}
