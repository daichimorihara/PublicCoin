//
//  AuthTestView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/03.
//

import SwiftUI

struct AuthTestView: View {
    @StateObject var vm = AuthViewModel()
    @AppStorage("signin") var yes = false
    
    var body: some View {
        ZStack {
            Button {
                vm.signOut()
            } label: {
                Text("log out")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
            }
            .opacity(yes ? 1 : 0)

            
            if !UserDefaults.standard.bool(forKey: "signin") {
                ZStack {
                    SignInView()
                }
                .opacity(yes ? 0 : 1)
            }
        }
    }
}

struct AuthTestView_Previews: PreviewProvider {
    static var previews: some View {
        AuthTestView()
    }
}
