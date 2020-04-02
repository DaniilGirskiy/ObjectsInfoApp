//
//  ContainerViewControllerAssembly.swift
//  AVSOFT
//
//  Created by Danya on 06.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ContainerViewControllerAssembly {
    private lazy var containerRouterAssembly = ContainerRouterAssembly()
    
    var viewController: UIViewController {
        let controller = ContainerViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.router = containerRouterAssembly.router
        return controller
    }
    
}
