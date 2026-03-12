//
//  ProfileView.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 1/29/26.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(AuthViewModel.self) private var authViewModel
    
    
    var body: some View {
        
        VStack {
            
            Text("Profile View")
            
            Button {
                Task {
                    await authViewModel.signOut()
                }
            } label: {
                HStack {
                    Text("Log Out")
                    Image(systemName: "person.crop.circle")
                }
                
            }
            
        }
        
        
        
    }
}

#Preview {
    ProfileView()
        .environment(AuthViewModel())
}
