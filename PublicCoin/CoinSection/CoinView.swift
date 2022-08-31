//
//  CoinView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import SwiftUI

struct CoinView: View {
    @State private var text = "GE"
    var body: some View {
        VStack {
            Text("Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
            
            SearchBarView(searchText: $text)
            
        }
        .navigationBarHidden(true)
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView()
    }
}
