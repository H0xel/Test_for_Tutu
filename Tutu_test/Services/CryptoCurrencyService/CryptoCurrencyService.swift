//
//  Service.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import Combine
import Foundation
import UIKit

protocol CryptoCurrencyService {
    func get(loadedCount: Int, completion: @escaping (CryptoResponse) -> Void)
}

class CryptoCurrencyServiceImpl: CryptoCurrencyService {
    
    var network: NetworkService!
    
    func get(loadedCount: Int, completion: @escaping (CryptoResponse) -> Void) {
            self.buildUrL(loadedCount: loadedCount) {
                self.network.getRequest(url: $0) {
                    completion($0)
            }
        }
    }
}

extension CryptoCurrencyServiceImpl {
    func buildUrL(loadedCount: Int, completion: @escaping (URL) -> Void) {
        let page = (loadedCount / 100) + 1
        
        let urlString = "https://3commas.io/ru/coin_market_cap/cryptocurrencies?convert=usd&cryptocurrency_type=all&page=\(page)&type=LOAD_CRYPTO_CURRENCIES"
        
        if let url = URL(string: urlString)  {
            completion(url)
        } else {
            print(NetworkServiceError.internalError)
        }
    }
}
