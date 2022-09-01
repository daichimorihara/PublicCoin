//
//  NewsViewModel.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles = [Article]()
    let service = NewsService()
    
    init() {
        
    }
    
    
    func donwloadNews() async {
        if let fetched = try? await service.donwloadNews() {
            self.articles = fetched.filter({
                $0.title != nil &&
                $0.url != nil &&
                $0.urlToImage != nil
            })
        }
    }
}
