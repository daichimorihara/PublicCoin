//
//  SignInView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/02.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {

        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
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
                    Text("Sign In")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()

            }
            NavigationLink {
                RegisterView()
            } label: {
                HStack {
                    Text("Don't have an account?")
                        
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.blue)
            }

        }
        
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
