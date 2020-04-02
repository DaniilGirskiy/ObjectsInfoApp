//
//  ObjectCreationViewControllerAssembly.swift
//  AVSOFT
//
//  Created by Danya on 06.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectCreationViewControllerAssembly {
    private lazy var modelAssembly = ObjectCreationModelAssembly()
    
    var viewController: UIViewController {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ObjectCreationViewController") as! ObjectCreationViewController
        vc.model = modelAssembly.model
        vc.model.output = vc
        return vc
    }
}
