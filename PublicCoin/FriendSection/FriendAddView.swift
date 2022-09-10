//
//  FriendAddView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/09.
//

import SwiftUI

struct FriendAddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: FriendViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            header
            Divider()
            Text("FRIENDS RESULTS")
                .font(.headline)
                .padding(.leading)
            
            ScrollView {
                ForEach(vm.filteredFriends, id: \.self) { username in
                    FriendSearchRow(username: username,
                                    following: vm.isFollowing(username: username)) {
                        vm.updateFriend(username: username)
                    }

                }
            }
            Spacer()
            
        }
    }
}

struct FriendAddView_Previews: PreviewProvider {
    static var previews: some View {
        FriendAddView(vm: FriendViewModel())
    }
}

extension FriendAddView {
    private var header: some View {
        HStack {
            SSBarView(placeHolder: "Search by username", searchText: $vm.searchText)
            
            Button {
                vm.searchText = ""
                dismiss()
            } label: {
                Text("Cancel")
            }
            .foregroundColor(.theme.base)
        }
        .padding(.vertical)
        .padding(.horizontal, 5)
    }
}
