//
//  FriendView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/08.
//

import SwiftUI

struct FriendView: View {
    @StateObject var vm = AuthViewModel()
    @StateObject var coinVM = CoinViewModel()
    
    @State private var textUserName = ""
    
    var body: some View {
        VStack {
            header
            ScrollView {
                TextField("HGEIO", text: $textUserName)
                Button {
                    Task {
                        await coinVM.fetchFireCoins(username: textUserName)
                    }
                } label: {
                    Text("Fetch")
                        .padding()
                        .background(.blue)
                }
                
                ForEach(coinVM.friendCoins) { coin in
                    PortRow(coin: coin, allocation: coin.currentValue / coinVM.totalFrinedValue * 100)
                        .padding(5)
                    Divider()
                }
                
            }
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}

extension FriendView {
    private var header: some View {
        Text("My Friends")
            .foregroundColor(.theme.base)
            .font(.headline)
            .fontWeight(.heavy)
            .frame(width: UIScreen.main.bounds.width)
            .padding(.vertical)
            .overlay(
                HStack {
                    Button {
                        vm.signOut()
                    } label: {
                        Text("Sign Out")
                    }
                    .padding(.horizontal)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .foregroundColor(.theme.secondary)
                    .padding(.horizontal)
                }
            )
            
    }
}
