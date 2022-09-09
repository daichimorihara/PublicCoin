//
//  FireCoinService.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/09.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class FireCoinService {
    
    func updateCoins(coinID: String, amount: Double) {
        guard let username = UserDefaults.standard.string(forKey: "Username") else {
            print("Failed to find uid from UserDefaults Standard")
            return
        }
        let doc = Firestore.firestore()
            .collection("users")
            .document(username)
            .collection("coins")
            .document(coinID)
        
        let data = FireCoin(id: coinID, amount: amount)
        do {
            try doc.setData(from: data)
        } catch  {
            print("Failed to set coin data")
        }
    }
}
