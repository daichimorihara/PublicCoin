//
//  FriendViewModel.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/10.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class FriendViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var friends = [String]()
    @Published var filteredFriends = [String]()
    private var cancellables = Set<AnyCancellable>()
    @Published var followings = [String]()
    let service = PortDataService.shared

    
    init() {
        Task {
            await fetchFriends()
        }
        addSubscribers()
    }
    
    
    func fetchFriends() async {
        friends = await FireFriendService().fetchFriends()
    }
    
    func addSubscribers() {
        // firefriends
        $searchText
            .combineLatest($friends)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map({(text, ff) -> [String] in
                guard !text.isEmpty else {
                    return ff
                }
                let lower = text.lowercased()
                return ff.filter({
                    $0.contains(lower)
                })
            })
            .sink { [weak self] returnedFriends in
                self?.filteredFriends = returnedFriends
            }
            .store(in: &cancellables)
        
        // following
        service.$savedFriends
            .map({ (entities) -> [String] in
                entities
                    .compactMap { entity -> String? in
                        return entity.username
                    }
            })
            .sink { [weak self] returnedFollowings in
                self?.followings = returnedFollowings
            }
            .store(in: &cancellables)
        
    }
    

    
    func updateFriend(username: String) {
        service.updateFriend(username: username)
    }
    
    func isFollowing(username: String) -> Bool {
        return service.isFollowing(username: username)
    }
    
}
