//
//  DetailViewPresenter.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import Foundation

protocol DetailViewPresenter {
    func viewLoaded()
}

class DetailViewPresenterImpl: DetailViewPresenter {
    
    weak var view: DetailView?
    var currency: Cryptocurrency!
    
    func viewLoaded() {
        view?.display(currencyTitle: currency.name,
                      currencyPrice: String(currency.price),
                      chartImageUrl: currency.symbol)
    }
}
