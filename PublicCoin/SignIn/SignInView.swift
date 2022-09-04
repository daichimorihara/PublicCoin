//
//  SignInView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/02.
//

import SwiftUI

struct SignInView: View {
    @StateObject var vm = AuthViewModel()
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
                .textInputAutocapitalization(.never)
                
                CustomInputField(imageName: "lock",
                                 isSecure: true,
                                 placeholder: "password",
                                 text: $password)
                
                Button {
                    Task {
                        vm.waiting = true
                        try await vm.login(email: email, password: password)
                        vm.waiting = false
                    }
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
                RegisterView(vm: vm)
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
        .alert(vm.warningType.rawValue, isPresented: $vm.warning) {
            
        } message: {
            
        }
        
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
