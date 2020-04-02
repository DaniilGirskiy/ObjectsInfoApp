//
//  ObjectCreationRouter.swift
//  AVSOFT
//
//  Created by Danya on 16.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectCreationRouterAssembly {
    
    var router: ObjectCreationRouter {
        let router = ObjectCreationRouterImpl()
        return router
    }
    
}

protocol ObjectCreationRouter {
    func show(in vc: UIViewController)
}

class ObjectCreationRouterImpl: ObjectCreationRouter {
//    var objectCreationViewControllerAssembly = ObjectCreationViewControllerAssembly()
    
    func show(in vc: UIViewController) {
//        vc.navigationController?.pushViewController(objectCreationViewControllerAssembly.viewController,
//                                                    animated: true)
    }
}
