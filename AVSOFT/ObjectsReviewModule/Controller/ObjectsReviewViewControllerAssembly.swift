//
//  ObjectsReviewViewControllerAssembly.swift
//  AVSOFT
//
//  Created by Danya on 24.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectsReviewViewControllerAssembly {
    private lazy var modelAssembly = ObjectsReviewModelAssembly()
    private lazy var routerAssembly = ObjectsReviewRouterAssembly()
    
    var viewController: UIViewController {
        let vc = UIStoryboard(name: "ObjectsReview", bundle: nil).instantiateViewController(withIdentifier: "ObjectsReviewViewController") as! ObjectsReviewViewController
        vc.model = modelAssembly.model
        vc.router = routerAssembly.router
        vc.model.output = vc
        return vc
    }
}
