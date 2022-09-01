//
//  PublicCoinApp.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/30.
//

import SwiftUI

@main
struct PublicCoinApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //ContentView()
                //NewsView()
                CoinView()
            }
        }
    }
}
