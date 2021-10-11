//
//  Router.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import UIKit

protocol Router {
    func showDetail(cryptocurrency: Cryptocurrency)
}

class RouterImpl: Router {
    weak var viewcontroller: UIViewController?
    
    func showDetail(cryptocurrency: Cryptocurrency) {
        let vc = DetailViewControllerAssembly.instance().viewcontroller(currency: cryptocurrency)
        viewcontroller?.present(vc, animated: true, completion: nil)
    }
}
