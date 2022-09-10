//
//  FriendPortView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/10.
//

import SwiftUI

struct FriendPortView: View {
    @ObservedObject var vm: CoinViewModel
    var username: String
    var body: some View {
        VStack {
            ScrollView {
                PieView(slices: vm.friendSlices, totalValue: vm.totalFrinedValue)
                    .frame(width: UIScreen.main.bounds.width * 0.8,
                           height: UIScreen.main.bounds.width * 0.8)
                title
                ForEach(vm.friendCoins) { coin in
                    PortRow(coin: coin, allocation: coin.currentValue / vm.totalFrinedValue * 100)
                        .padding(5)
                    Divider()
                }
            }
            Spacer()
        }
        .navigationTitle(username)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FriendPortView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPortView(vm: CoinViewModel(), username: "Kim")
    }
}

extension FriendPortView {
    private var title: some View {
        HStack(spacing: 40) {
            Text("Symbol")
            Spacer()
            Text("Value")
            Text("Percentage")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
                
        }
        .padding()
        .font(.caption)
        .foregroundColor(.theme.secondary)
    }
}
