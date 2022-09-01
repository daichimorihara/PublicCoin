//
//  CoinViewModel.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/01.
//

import Foundation
import Combine

@MainActor
class CoinViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var filteredCoins = [Coin]()
    @Published var searchText = ""
    let service = CoinService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
//        $searchText
//            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//            .sink { [weak self] value in
//                if value.isEmpty {
//                    return
//                } else {
//                    let lower = value.lowercased()
//                    self?.coins.filter({ $0.symbol.lowercased().contains(lower) ||
//                        $0.name.lowercased().contains(lower)
//                    })
//                }
//            }
//            .store(in: &cancellables)
        $searchText
            .combineLatest($coins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map({(text, coins) -> [Coin] in
                guard !text.isEmpty else {
                    return coins
                }
                let lower = text.lowercased()
                return coins.filter({
                    $0.name.lowercased().contains(lower) ||
                    $0.symbol.lowercased().contains(lower) ||
                    $0.id.lowercased().contains(lower)
                })
            })
            .sink { [weak self] returnedCoins in
                self?.filteredCoins = returnedCoins
            }
            .store(in: &cancellables)
    }

    
    func fetchCoins() async {
        if let fetched = try? await service.downloadCoins() {
            self.coins = fetched
        }
    }
    
    func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }
        let lower = text.lowercased()
        return coins.filter({
            $0.name.lowercased().contains(lower) ||
            $0.symbol.lowercased().contains(lower) ||
            $0.id.lowercased().contains(lower)
        })
    }
}
