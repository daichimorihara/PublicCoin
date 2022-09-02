//
//  RegisterView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/02.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                CustomInputField(imageName: "person",
                                 isSecure: false,
                                 placeholder: "Username",
                                 text: $username)
                CustomInputField(imageName: "envelope",
                                 isSecure: false,
                                 placeholder: "Email",
                                 text: $email)
                CustomInputField(imageName: "lock",
                                 isSecure: true,
                                 placeholder: "password",
                                 text: $password)
                Button {
                    
                } label: {
                    Text("Create a new Account")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()

            }
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.blue)
                .font(.footnote)
            }

        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
