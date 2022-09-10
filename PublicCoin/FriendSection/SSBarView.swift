//
//  SSBarView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/10.
//

import SwiftUI

struct SSBarView: View {
    var placeHolder: String
    @Binding var searchText: String
    @FocusState var name: Bool
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.vertical)
                .onTapGesture {
                    name = true
                }
            
            TextField(placeHolder, text: $searchText)
                .padding(.vertical)
                .disableAutocorrection(true)
                .focused($name)
                
            
            
        }
        .overlay(
            Image(systemName: "xmark.circle.fill")
                .padding()
                .foregroundColor(.theme.base)
                .opacity(searchText.isEmpty ? 0.0 : 1.0)
                .onTapGesture {
                    searchText = ""
                    name = false
                }
            
            ,alignment: .trailing
        
        )
        .frame(height: 40)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.base.opacity(0.05))
        )
        
        
    }
}

struct SSBarView_Previews: PreviewProvider {
    static var previews: some View {
        SSBarView(placeHolder: "HEUGHUI", searchText: .constant(""))
    }
}
