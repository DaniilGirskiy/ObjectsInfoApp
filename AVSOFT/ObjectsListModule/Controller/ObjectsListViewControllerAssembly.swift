//
//  ObjectsListViewControllerAssembly.swift
//  AVSOFT
//
//  Created by Danya on 05.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectsListViewControllerAssembly {
    private lazy var modelAssembly = ObjectsListModelAssembly()
    private lazy var objectsListRouterAssembly = ObjectsListRouterAssembly()
    
    var viewController: UIViewController {
        
        let controller = ObjectsListViewController()
        controller.model = modelAssembly.model
        controller.model.output = controller
        controller.router = objectsListRouterAssembly.router
        
        return controller
    }
    
    
    
}
