//
//  ContentView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    @State private var index = 0
    var body: some View {
        TabView(selection: $index) {
            NewsView()
                .tabItem({
                    Image(systemName: "newspaper.fill")
                })
                .tag(0)
            
            CoinView()
                .tabItem {
                    Image(systemName: "eye.fill")
                }
                .tag(1)
            Text("Share")
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
