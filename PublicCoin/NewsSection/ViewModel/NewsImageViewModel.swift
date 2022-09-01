//
//  NewsImageViewModel.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import Foundation
import UIKit

@MainActor
class NewsImageViewModel: ObservableObject {
    @Published var image: UIImage?
    let article: Article
    let service: ImageService
    let manager = ImageCacheManager.instance
    
    init(article: Article) {
        self.article = article
        self.service = ImageService(article: article)
    }
    
    func fetchImage() async {
        if let savedImage = manager.get(key: article.id) {
            image = savedImage
        } else {
            guard let urlString = article.urlToImage else { return }
            self.image = try? await service.downloadImage(urlString: urlString)
        }
    }
}
