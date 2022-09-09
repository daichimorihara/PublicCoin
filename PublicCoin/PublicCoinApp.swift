//
//  PublicCoinApp.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/30.
//

import SwiftUI
import Firebase

@main
struct PublicCoinApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            
                ContentView()

              //  NewsView()
//                CoinView()
              //  SignInView()
            //    AuthTestView()
              //  HomeView()
            
        }
    }
}
