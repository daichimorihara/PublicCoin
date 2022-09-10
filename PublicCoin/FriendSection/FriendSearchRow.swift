//
//  FriendSearchRow.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/10.
//

import SwiftUI

struct FriendSearchRow: View {
    var username: String
    var following: Bool
    var updateFollowingStatus: () -> ()
    
    var body: some View {
        HStack {
            Text(username)
                .font(.headline)
                .foregroundColor(.theme.base)
            Spacer()
            
            Button {
                updateFollowingStatus()
            } label: {
                Text(following ? "Unfollow" : "Follow")
                    .foregroundColor(.theme.base)
                    .padding(5)
                    .background(
                        Color.theme.base.opacity(0.2)
                    )
            }

        }
        .padding(.horizontal)
    }
}

struct FriendSearchRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendSearchRow(username: "Daichi", following: true, updateFollowingStatus: {})
    }
}
