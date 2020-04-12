//
//  AuthenticationServiceAssembly.swift
//  AVSOFT
//
//  Created by Danya on 10.04.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class AuthenticationServiceAssembly {
    private static let authService = AuthenticationServiceImpl()  // singletone
    
    var service: AuthenticationService {
        return AuthenticationServiceAssembly.authService
    }
}
