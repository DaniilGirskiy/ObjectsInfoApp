//
//  SignUpViewControllerAssembly.swift
//  AVSOFT
//
//  Created by Danya on 10.04.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class SignUpViewControllerAssembly {
    private lazy var authServiceAssembly = AuthenticationServiceAssembly()
    
    var controller: UIViewController {
        
        let signUpVC = UIStoryboard(name: "SignUp", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        signUpVC.authService = authServiceAssembly.service
        
        let navController = UINavigationController(rootViewController: signUpVC)
        navController.modalPresentationStyle = .fullScreen
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        return navController
    }
    
}
