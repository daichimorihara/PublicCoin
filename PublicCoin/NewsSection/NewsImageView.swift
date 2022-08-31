//
//  NewsImageView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import SwiftUI

struct NewsImageView: View {
    @ObservedObject var vm: NewsImageViewModel
    
    init(article: Article) {
        vm = NewsImageViewModel(article: article)
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 5)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3).foregroundColor(.theme.secondary))
                    
            } else {
                ProgressView()
                    .scaleEffect(1.5)
                    .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 5)
            }
        }
        .task {
            await vm.fetchImage()
        }
    }
}

struct NewsImageView_Previews: PreviewProvider {
    static var previews: some View {
        NewsImageView(article: dev.article)
    }
}
