//
//  ObjectsReviewRouter.swift
//  AVSOFT
//
//  Created by Danya on 24.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectsReviewRouterAssembly {
    
    var router: ObjectsReviewRouter {
        let router = ObjectsReviewRouterImpl()
        return router
    }
    
}

protocol ObjectsReviewRouter {
    func show(in vc: UIViewController, with index: Int)
}

class ObjectsReviewRouterImpl: ObjectsReviewRouter {
    var objectEditingViewControllerAssembly = ObjectEditingViewControllerAssembly()
    
    func show(in vc: UIViewController, with index: Int) {
        vc.navigationController?.pushViewController(objectEditingViewControllerAssembly.objectEditingVC(index: index), animated: true)
    }
}
