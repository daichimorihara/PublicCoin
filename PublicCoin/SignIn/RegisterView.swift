//
//  RegisterView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/02.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var vm: AuthViewModel
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                CustomInputField(imageName: "person", isSecure: false, placeholder: "Username", text: $username)
                CustomInputField(imageName: "envelope", isSecure: false, placeholder: "Email", text: $email)
                .textInputAutocapitalization(.never)
                CustomInputField(imageName: "lock", isSecure: true, placeholder: "password", text: $password)

                registerButton
                Spacer()

            }
            signInLink
            
            if vm.waiting {
                ProgressView()
                    .scaleEffect(3)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(Color.theme.background)
            }
        }
        .alert(vm.warningType.rawValue, isPresented: $vm.warning) {
            
        } message: {
            
        }

    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(vm: AuthViewModel())
    }
}

extension RegisterView {
    private var registerButton: some View {
        Button {
            Task {
                vm.waiting = true
                try await vm.createNewUser(email: email,
                                           password: password,
                                           username: username)
                vm.waiting = false
            }
        } label: {
            Text("Create a new Account")
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
    
    private var signInLink: some View {
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
