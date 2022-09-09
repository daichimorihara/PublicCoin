//
//  ContentView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("signin") var yes = false

    var body: some View {
        ZStack {
            HomeView()
                .navigationBarHidden(true)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
