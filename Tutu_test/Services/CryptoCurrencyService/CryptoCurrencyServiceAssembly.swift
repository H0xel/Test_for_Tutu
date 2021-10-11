//
//  CryptoCurrencyServiceAssembly.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 11.10.2021.
//

import Foundation
import EasyDi

class CryptoCurrencyServiceAssembly: Assembly {
    
    private lazy var networkService: NetworkServiceAssembly = context.assembly()
    
    var cryptoCurrencyService: CryptoCurrencyService {
        define(init: CryptoCurrencyServiceImpl()) {
            $0.network = self.networkService.networkService
            return $0
        }
    }
}
