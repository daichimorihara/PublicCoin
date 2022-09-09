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
    @Published var waiting = false
    @Published var warning = false
    @Published var warningType: WarningType = .tryAgain
    
    enum WarningType: String {
        case notUnique = "This username alreadly exist"
        case passOremail = "Email or Password isn't correct"
        case tryAgain = "Try Again"
    }

    
    func createNewUser(email: String, password: String, username: String) async throws {
        guard try await !checkUsernameExists(username: username) else {
            await MainActor.run(body: {
                self.warning = true
                self.warningType = .notUnique
            })
            print("username isn't unique")
            return
        }
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            let uid = result.user.uid
            
            try await Firestore.firestore()
                .collection("users")
                .document(username)
                .setData(["uid" : uid])
            

            defaultChange(bool: true)
            UserDefaults.standard.set(uid, forKey: "UserID")
            UserDefaults.standard.set(username, forKey: "Username")
        } catch {
            await MainActor.run(body: {
                self.warning = true
                self.warningType = .tryAgain
            })
            print("fail to create an account")
        }

    }
    
    func login(email: String, password: String) async throws {
//        if let _ = try await Auth.auth().signIn(withEmail: email, password: password) {
//            defaultChange(bool: true)
//        } else {
//            self.warning = true
//            self.warningType = .passOremail
//            print("Failed to login")
//        }
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            let uid = result.user.uid
            guard let username = try await Firestore.firestore()
                .collection("users")
                .getDocuments()
                .documents.first(where: { $0.data()["uid"] as! String == uid })?.documentID else {
                print("Failed to find user name")
                return
            }
            defaultChange(bool: true)
            UserDefaults.standard.set(uid, forKey: "UserID")
            UserDefaults.standard.set(username, forKey: "Username")
            print(username)
        } catch  {
            await MainActor.run(body: {
                self.warning = true
                self.warningType = .passOremail
            })
    
            print("Failed to login")
        }
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            defaultChange(bool: false)
            UserDefaults.standard.set("", forKey: "UserID")
            UserDefaults.standard.set("", forKey: "Username")
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
