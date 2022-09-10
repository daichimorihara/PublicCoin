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
    //@StateObject var vm = CoinViewModel()
    
    var body: some Scene {
        WindowGroup {
            
                ContentView()
                //.environmentObject(vm)

              //  NewsView()
//                CoinView()
              //  SignInView()
            //    AuthTestView()
              //  HomeView()
            
        }
    }
}
