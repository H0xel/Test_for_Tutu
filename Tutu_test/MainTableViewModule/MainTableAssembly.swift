//
//  MainTableAssembly.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import Foundation
import EasyDi

class MainTableAssembly: Assembly {
    
    private lazy var cryptoServiceAssembly: CryptoCurrencyServiceAssembly = context.assembly()
    private lazy var routerAssembly: routerAssembly = context.assembly()
    
    func mainTableViewController() -> UITableViewController {
        define(init: MainTableViewController()) {
            $0.presenter = self.presenter(view: $0)
            return $0
        }
    }
}

extension MainTableAssembly {
    func presenter(view: MainView) -> MainTablePresenter {
        define(init: MainTablePresenterImpl()) {
            $0.view = view
            $0.cryptoCurrencyService = self.cryptoServiceAssembly.cryptoCurrencyService
            $0.router = self.routerAssembly.router(viewcontroller: view.viewcontoller)
            return $0
        }
    }
}
