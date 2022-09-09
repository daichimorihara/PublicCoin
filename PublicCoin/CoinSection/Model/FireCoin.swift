//
//  FireCoin.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/09.
//

import Foundation
import FirebaseFirestoreSwift

struct FireCoin: Identifiable, Codable {
    @DocumentID var id: String?
    var amount: Double
}
