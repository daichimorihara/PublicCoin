//
//  NewsRow.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import SwiftUI

struct NewsRow: View {
    let article: Article
    
    var body: some View {
        HStack {
            Text(article.title!)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .frame(width: UIScreen.main.bounds.width / 4 * 3, alignment: .leading)
            
            Spacer()
            
            NewsImageView(article: article)
//            Image("biden")
//                .resizable()
//                .scaledToFill()
//                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 5)
//                .clipped()
//                .cornerRadius(10)
            
            
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(article: dev.article)
    }
}
