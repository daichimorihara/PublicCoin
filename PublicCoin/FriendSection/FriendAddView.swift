//
//  FriendAddView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/09.
//

import SwiftUI

struct FriendAddView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FriendAddView_Previews: PreviewProvider {
    static var previews: some View {
        FriendAddView()
    }
}

extension FriendAddView {
    private var header: some View {
        Text("Find your friends")
            .font(.headline)
            .fontWeight(.heavy)
            .frame(width: UIScreen.main.bounds.width)
            .overlay(
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "chevron.left")
                            Text("My Holdings")
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "checkmark")
                            //.opacity(check ? 1 : 0)

                        Button {
                            //saveButtonPressed()
                        } label: {
                            Text("Save")
                                .fontWeight(.semibold)
                        }
//                        .opacity(selectedCoin != nil &&
//                                 selectedCoin?.holding != Double(amount) ? 1.0 : 0.0
//                        )
                    }
                }
                    .foregroundColor(.theme.base)
                    .padding(.horizontal)
            )
    }
}
