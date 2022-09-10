//
//  PortDataService.swift
//  PrivateCoin
//
//  Created by Daichi Morihara on 2022/09/04.
//

import Foundation
import CoreData
import UIKit

class PortDataService {
    static let shared = PortDataService()
    
    private let container: NSPersistentContainer
    @Published var savedEntities = [PortEntity]()
    @Published var savedFriends = [FriendEntity]()
    
    
    private init() {
        container = NSPersistentContainer(name: "PortContainer")
        container.loadPersistentStores { _, err in
            if let err = err {
                print("Failed to laod Core Data \(err)")
            }
            //
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
            self.getPort()
            self.getFriends()
        }
    }
    
    func updatePort(coin: Coin, amount: Double) {
        if let entity = savedEntities.first(where: {$0.id == coin.id}) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    func updateFriend(username: String) {
        if let entity = savedFriends.first(where: {$0.username == username}) {
            deleteFriend(entity: entity)
        } else {
            addFriend(username: username)
        }
    }
    
    func isFollowing(username: String) -> Bool {
        if savedFriends.first(where: {$0.username == username}) != nil {
            return true
        } else {
            return false
        }
    }
    
    private func add(coin: Coin, amount: Double) {
        let entity = PortEntity(context: container.viewContext)
        entity.id = coin.id
        entity.amount = amount
        applyChange()
    }
    
    private func delete(entity: PortEntity) {
        container.viewContext.delete(entity)
        applyChange()
    }
    
    private func update(entity: PortEntity, amount: Double) {
        entity.amount = amount
        applyChange()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch  {
            print("Failed to save to Core Data \(error)")
        }
    }
    
    private func getPort() {
        let request = NSFetchRequest<PortEntity>(entityName: "PortEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch  {
            print("Failed to fetch Core Data \(error)")
        }
    }
    
    private func getFriends() {
        let request = NSFetchRequest<FriendEntity>(entityName: "FriendEntity")
        do {
            savedFriends = try container.viewContext.fetch(request)
        } catch  {
            print("Failed to fetch core Data \(error)")
        }
    }
    
    private func friendsChangeApplied() {
        save()
        getFriends()
    }
    
    private func addFriend(username: String) {
        let entity = FriendEntity(context: container.viewContext)
        entity.username = username
        friendsChangeApplied()
    }
    
    private func deleteFriend(entity: FriendEntity) {
        container.viewContext.delete(entity)
        friendsChangeApplied()
    }
    
    private func applyChange() {
        save()
        getPort()
    }
    
}
