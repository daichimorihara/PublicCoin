//
//  PreviewProvider.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    let article = Article(title: "Elon Musk reportedly wanted to entrust his fortune to a 34-year-old former pro gambler who dropped out of college to smoke weed - Yahoo Finance", url: "", urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/220716073629-05-biden-saudi-arabia-0716-super-tease.jpg")
}
