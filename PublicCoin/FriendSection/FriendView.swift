//
//  FriendView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/08.
//

import SwiftUI

struct FriendView: View {
    @StateObject var authVM = AuthViewModel()
    @StateObject var vm = FriendViewModel()
    @StateObject var coinVM = CoinViewModel()
    
    @State private var show = false
    @State private var selectedUsername: String?
    @State private var showPort = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(isActive: $showPort) {
                    FriendPortView(vm: coinVM, username: selectedUsername ?? "Unknown")
                        
                } label: {
                    EmptyView()
                }

                header
                ScrollView {
                    
                    ForEach(vm.followings, id: \.self) { username in
                        HStack {
                            Text(username)
                                .bold()
                            Spacer()
                        }
                        .padding()
                        .contentShape(Rectangle())
                        .onTapGesture {
                            Task {
                                await coinVM.fetchFireCoins(username: username)
                            }
                            selectedUsername = username
                            showPort.toggle()
                        }
                    }
                    
                }
                Spacer()
            }
            .fullScreenCover(isPresented: $show, onDismiss: {
                
            }, content: {
                FriendAddView(vm: vm)
            })
            .navigationBarHidden(true)
        }
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
                        authVM.signOut()
                    } label: {
                        Text("Sign Out")
                    }
                    .padding(.horizontal)
                    Spacer()
                    Button {
                        show.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .foregroundColor(.theme.secondary)
                    .padding(.horizontal)
                }
            )
            
    }
}
