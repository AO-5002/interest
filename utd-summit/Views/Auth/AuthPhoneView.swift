//
//  PhoneField.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/1/26.
//

import SwiftUI

public struct AuthPhoneView: View {
    
    @State var authViewModel: AuthViewModel
    @State private var phone = ""
    
    @FocusState private var isFocused: Bool
    
    public var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button {
                    // Country code selector action
                } label: {
                    Text("+1")
                        .foregroundStyle(.black)
                }
                
                TextField("Phone Number", text: $phone)
                    .focused($isFocused)
                    .keyboardType(.phonePad)
                    .textContentType(.telephoneNumber)
                    .autocorrectionDisabled()
            }
            .padding()
            .background(.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFocused ? .gray.opacity(0.8) : .gray.opacity(0.3), lineWidth: 1)
            )
            
            ButtonView(text: "Continue") {
                await authViewModel.sendPhoneOTP(phone: phone)
            }
        }
    }
}

#Preview {
    AuthPhoneView(authViewModel: AuthViewModel())
}
