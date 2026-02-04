//
//  HomeView.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 1/29/26.
//

import SwiftUI

// Main View

struct HomeView: View {
    @Namespace private var toolbarNamespace
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    Text("Gallery")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    TopToolbarGroup(namespace: toolbarNamespace)
                }
                .padding([.bottom], 24)
                
                
                
                GalleryView()
                Spacer()
            }
            
            .padding()
        }
    }
}

// Supporting Components

//struct Header(): View {
//    
//}

struct ButtonData: Identifiable {
    var id: UUID = UUID()
    var systemImage: String
    var action: (() -> Void)?
}

let ButtonGroup: [ButtonData] = [
    .init(systemImage: "die.face.5.fill"),
    .init(systemImage: "slider.horizontal.3")
]

struct TopToolbarGroup: View {
    var namespace: Namespace.ID
    
    var body: some View {
        GlassEffectContainer(){
            HStack(spacing: 12) {
                ForEach(ButtonGroup.indices, id: \.self) { item in
                    ToolbarButton(image: ButtonGroup[item].systemImage)
                        .glassEffectUnion(id: item < 2 ? "1" : "2", namespace: namespace)
                }
            }
        }
    }
}

struct ToolbarButton: View {
    
    public var image: String
    
    
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: image)
                .font(.title2)
                .foregroundStyle(.black)
                
        }
        .padding(8)
        .glassEffect(.regular.interactive())
    }
}


#Preview {
    HomeView()
}
