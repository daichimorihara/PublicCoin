//
//  HomeView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/08.
//

import SwiftUI

struct HomeView: View {
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
            PortView()
                .tabItem {
                    Image(systemName: "bitcoinsign.circle")
                }
                .tag(2)
            FriendView()
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(3)
            
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
