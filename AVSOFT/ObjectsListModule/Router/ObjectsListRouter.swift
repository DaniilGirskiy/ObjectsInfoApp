//
//  ObjectsListRouter.swift
//  AVSOFT
//
//  Created by Danya on 10.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectsListRouterAssembly {
    
    var router: ObjectsListRouter {
        let router = ObjectsListRouterImpl()
        return router
    }
    
}

protocol ObjectsListRouter {
    func show(in vc: UIViewController)
    func show(in vc: UIViewController, with index: Int)
}

class ObjectsListRouterImpl: ObjectsListRouter {
    var objectCreationViewControllerAssembly = ObjectCreationViewControllerAssembly()
    var objectEditingViewControllerAssembly = ObjectEditingViewControllerAssembly()
    
    func show(in vc: UIViewController) {
        vc.navigationController?.pushViewController(objectCreationViewControllerAssembly.viewController,
                                                    animated: true)
    }
    
    func show(in vc: UIViewController, with index: Int) {
        vc.navigationController?.pushViewController(objectEditingViewControllerAssembly.objectEditingVC(index: index), animated: true)
    }
}
