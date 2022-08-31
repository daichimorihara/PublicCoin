//
//  NewsView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import SwiftUI

struct NewsView: View {
    @StateObject var vm = NewsViewModel()
    
    var body: some View {
        VStack {
            Text("Trending News")
                .font(.headline)
                .fontWeight(.heavy)
            List {
                ForEach(vm.articles) { article in
                    NewsRow(article: article)
                        .listRowInsets(.init(top: 5, leading: 5, bottom: 5, trailing: 0))
                }
            }
            .listStyle(PlainListStyle())
        }
        .foregroundColor(.theme.base)
        .navigationBarHidden(true)
        .task {
            await vm.donwloadNews()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
