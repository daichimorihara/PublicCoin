//
//  NewsService.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import Foundation

class NewsService {
    
    func donwloadNews() async throws -> [Article] {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(APIKey.key)"
        guard let url = URL(string: urlString) else {
            print("1")
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decoded = try? JSONDecoder().decode(Response.self, from: data).articles {
                print("2")
                return decoded
            } else {
                print("3")
                return [Article(title: nil, url: nil, urlToImage: nil)]
            }
        } catch  {
            print("4")
            throw error
        }
        
    }
}
