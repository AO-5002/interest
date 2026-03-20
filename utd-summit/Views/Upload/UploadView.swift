//
//  UploadView.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 3/13/26.
//

import SwiftUI
import Foundation
import PhotosUI


struct UploadView: View {
    
    
    @State private var selectedFile: PhotosPickerItem?
    @State private var photosPickerItem: PhotosPickerItem?
    
    @State private var title: String = ""
    @State private var abstract: String = ""
    @State private var tag: String = ""
    @State private var tags: [Tag] = []
    
    
    var body: some View {
        VStack {
            
            HStack(spacing: 12) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150)
                
                
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150)
            }
            
            Form {
                SectionFieldView(sectionName: "Title", mutatableField: title)
                SectionFieldView(sectionName: "Abstract", mutatableField: abstract)
            }
            
            Spacer()
        }
    }
}


struct SectionFieldView: View {
    
    let sectionName: String
    @State var mutatableField: String
    
    var body: some View {
        TextField("\(sectionName)", text: $mutatableField)
    }
}

struct TagSectionView: View {
    let sectionName: String
    @State var mutatableField: String
    
    var body: some View {
        TextField("\(sectionName)", text: $mutatableField)
    }
}

#Preview {
    UploadView()
}
