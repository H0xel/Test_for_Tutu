//
//  DetailViewControllerAssembly.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import Foundation
import EasyDi


class DetailViewControllerAssembly: Assembly {
    
    lazy private var networkService: NetworkServiceAssembly = context.assembly()
    
    func viewcontroller(currency: Cryptocurrency) -> UIViewController {
        define(init: DetailViewController()) {
            $0.presenter = self.presenter(view: $0, currency: currency)
            return $0
        }
    }
}

extension DetailViewControllerAssembly {
    
    func presenter(view: DetailView, currency: Cryptocurrency) -> DetailViewPresenter {
        define(init: DetailViewPresenterImpl()) {
            $0.currency = currency
            $0.view = view
            return $0
        }
    }
}
