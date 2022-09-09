//
//  NewsView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import SwiftUI

struct NewsView: View {
    @StateObject var vm = NewsViewModel()
    @State private var urlString = ""
    @State private var showWeb = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(isActive: $showWeb,
                               destination: { WebSiteView(urlString: $urlString)
                },
                               label: { EmptyView() })
                Text("Trending News")
                    .font(.headline)
                    .fontWeight(.heavy)
                List {
                    ForEach(vm.articles) { article in
                        NewsRow(article: article)
                            .listRowInsets(.init(top: 5, leading: 5, bottom: 5, trailing: 0))
                            .onTapGesture {
                            urlString = article.url ?? ""
                            showWeb = true
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .foregroundColor(.theme.base)
            .navigationBarHidden(true)
            .task {
                await vm.donwloadNews()
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
