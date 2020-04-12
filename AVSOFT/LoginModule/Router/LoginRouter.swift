//
//  LoginRouter.swift
//  AVSOFT
//
//  Created by Danya on 28.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class LoginRouterAssembly {
    
    var router: LoginRouter {
        let router = LoginRouterImpl()
        return router
    }
    
}

protocol LoginRouter {
    func show(in vc: UIViewController)
    func showSignUpModule(in vc: UIViewController)
}

class LoginRouterImpl: LoginRouter {
    private lazy var containerViewControllerAssembly = ContainerViewControllerAssembly()
    private lazy var signUpViewControllerAssembly = SignUpViewControllerAssembly()
    
    func show(in vc: UIViewController) {
        vc.present(containerViewControllerAssembly.viewController, animated: true, completion: nil)
    }
    
    func showSignUpModule(in vc: UIViewController) { // в ассембли
        
        
        vc.present(signUpViewControllerAssembly.controller, animated: true, completion: nil)
    
    }
    
}
