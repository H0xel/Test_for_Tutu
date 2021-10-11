//
//  NetworkService.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import Foundation
import UIKit
import Combine

enum NetworkServiceError: Error {
    case internalError
    case networkError(Error)
}

protocol NetworkService {
    func getRequest<T: Decodable>(url: URL, completion: @escaping (T) -> Void)
}

class NetworkServiceImpl: NetworkService {
    
    var cacheStorage = [String: Data]()
    
    func getRequest<T: Decodable>(url: URL, completion: @escaping (T) -> Void) {
        
        if let cache = cacheStorage["cacheData"] {
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(T.self, from: cache)
                completion(json)
            } catch {
                print(NetworkServiceError.internalError)
            }
        } else {
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print(NetworkServiceError.internalError)
                return
            }
            
            self.cacheStorage["cacheData"] = data
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(T.self, from: data)
                completion(json)
            } catch {
                print(NetworkServiceError.internalError)
                }
            }
            dataTask.resume()
        }
    }
}
