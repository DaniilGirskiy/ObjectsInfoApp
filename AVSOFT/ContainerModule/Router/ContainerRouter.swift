//
//  ContainerRouter.swift
//  AVSOFT
//
//  Created by Danya on 10.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ContainerRouterAssembly {
    
    var router: ContainerRouter {
        let router = ContainerRouterImpl()
        return router
    }
    
}

protocol ContainerRouter {
    func show(in vc: UIViewController)
    func showReview(in vc: UIViewController)
    func showProgramInformation(in vc: UIViewController)
}

class ContainerRouterImpl: ContainerRouter {
    private lazy var objectsListViewControllerAssembly = ObjectsListViewControllerAssembly()
    private lazy var objectsReviewViewControllerAssembly = ObjectsReviewViewControllerAssembly()
    
    func show(in vc: UIViewController) { // убрать все кишки в ассембли
        let navController = UINavigationController(rootViewController: objectsListViewControllerAssembly.viewController)
        navController.navigationBar.tintColor = .black 
        navController.modalPresentationStyle = .fullScreen
        vc.present(navController, animated: true, completion: nil)
    }
    
    func showReview(in vc: UIViewController) {
        
        let navController = UINavigationController(rootViewController: objectsReviewViewControllerAssembly.viewController)
        navController.navigationBar.tintColor = .orange
        navController.modalPresentationStyle = .fullScreen
        vc.present(navController, animated: true, completion: nil)
    }
    
    func showProgramInformation(in vc: UIViewController) {
        
    }
    
}
