//
//  RouterAssembly.swift
//  Tutu_test
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import Foundation
import EasyDi

class routerAssembly: Assembly {
    func router(viewcontroller: UIViewController) -> Router {
        define(init: RouterImpl()) {
            $0.viewcontroller = viewcontroller
            return $0
        }
    }
}
