//
//  MainTablePresenter.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import Foundation

protocol MainTablePresenter {
    func viewLoaded()
    func loadMore()
    func cellTapped(indexPath: IndexPath)
}

class MainTablePresenterImpl: MainTablePresenter {
    
    weak var view: MainView?
    var cryptoCurrencyService: CryptoCurrencyService!
    var router: Router!
    
    func viewLoaded() {
        cryptoCurrencyService.get(loadedCount: 99) {
            self.view?.tableViewState = TableViewState(cryptocurrencies: $0.cryptocurrencies)
        }
    }
    
    func loadMore() {
        cryptoCurrencyService.get(loadedCount: view?.tableViewState?.cryptocurrencies.count ?? 0) {
            self.view?.tableViewState?.cryptocurrencies.append(contentsOf: $0.cryptocurrencies)
        }
    }
    
    func cellTapped(indexPath: IndexPath) {
        guard let cryptocurrency = view?.tableViewState?.cryptocurrencies[indexPath.row] else { return }
        router.showDetail(cryptocurrency: cryptocurrency)
    }
}

