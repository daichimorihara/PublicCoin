//
//  ImageService.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import Foundation
import UIKit

class ImageService {
    let manager = ImageCacheManager.instance
    let article: Article
    init(article: Article) {
        self.article = article
    }
    
    func downloadImage(urlString: String) async throws -> UIImage? {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            // add to cache
            manager.add(key: article.id, value: image)
            return image
        } catch  {
            return nil
        }
        
    }
    
}
