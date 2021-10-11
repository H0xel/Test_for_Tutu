//
//  NetworkServiceAssembly.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 11.10.2021.
//

import Foundation
import EasyDi

class NetworkServiceAssembly: Assembly {
    
    var networkService: NetworkService {
        define(init: NetworkServiceImpl())
    }
}
