//
//  FireFriendService.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/09.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class FireFriendService {
    
//    func fetchFireCoins(username: String) async throws -> [FireCoin] {
//        do {
//            let snap = try await Firestore.firestore()
//                .collection("users")
//                .getDocuments()
//            snap.documents.filter { $0.data()["username"] as! String == username}
//                
//        } catch {
//            
//        }
//            
//    }
    func fetchFireCoins(username: String) async -> [FireCoin] {
        var temp: [FireCoin] = []
        do {
            let snap = try await Firestore.firestore().collection("users")
                .document(username)
                .collection("coins")
                .getDocuments()
            for document in snap.documents {
                temp.append(try document.data(as: FireCoin.self))
            }
            
        } catch  {
            
        }
        return temp
    }
    func updateCoins(coinID: String, amount: Double) {
        guard let uid = UserDefaults.standard.string(forKey: "UserID") else {
            print("Failed to find uid from UserDefaults Standard")
            return
        }
        let doc = Firestore.firestore()
            .collection("users")
            .document(uid)
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
