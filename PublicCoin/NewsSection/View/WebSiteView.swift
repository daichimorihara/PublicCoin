//
//  WebSiteView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/02.
//

import SwiftUI

struct WebSiteView: View {
    @Binding var urlString: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Back")
                }
                .padding(.leading)

                Spacer()
            }
            WebUIView(urlString: $urlString)
        }
        .navigationBarHidden(true)
    }
}

struct WebSiteView_Previews: PreviewProvider {
    static var previews: some View {
        WebSiteView(urlString: .constant(""))
    }
}
