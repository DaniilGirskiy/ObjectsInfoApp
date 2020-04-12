//
//  LoginViewControllerAssembly.swift
//  AVSOFT
//
//  Created by Danya on 28.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class LoginViewControllerAssembly {
    private lazy var loginRouterAssembly = LoginRouterAssembly()
    private lazy var authServiceAssembly = AuthenticationServiceAssembly()
    
    var controller: UIViewController {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        loginVC.router = loginRouterAssembly.router
        loginVC.authService = authServiceAssembly.service
        
        return loginVC
    }
    
}
