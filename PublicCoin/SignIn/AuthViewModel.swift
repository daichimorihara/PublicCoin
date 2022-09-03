//
//  AuthViewModel.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/03.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthViewModel: ObservableObject {
    
    
    func createNewUser(email: String, password: String, username: String) async throws {
        guard try await !checkUsernameExists(username: username) else {
            print("username isn't unique")
            return
        }
        do {
            let _ = try await Auth.auth().createUser(withEmail: email, password: password)
            
            try await Firestore.firestore()
                .collection("users")
                .document(username)
                .setData(["init" : "done"])
            

            defaultChange(bool: true)
        } catch {
            print("fail to create an account")
        }

    }
    
    func login(email: String, password: String) async throws {
        if let _ = try? await Auth.auth().signIn(withEmail: email, password: password) {
            defaultChange(bool: true)
        } else {
            print("Failed to login")
        }
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            defaultChange(bool: false)
        } catch {
            print("failed to log out")
        }
    }
    
    func checkUsernameExists(username: String) async throws -> Bool {
        let doc = Firestore.firestore().collection("users").document(username)
        return try await doc.getDocument().exists
    }
    
    func defaultChange(bool: Bool) {
        UserDefaults.standard.set(bool, forKey: "signin")
    }
}
