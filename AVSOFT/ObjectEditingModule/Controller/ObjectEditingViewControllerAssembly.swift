//
//  ObjectEditingViewControllerAssembly.swift
//  AVSOFT
//
//  Created by Danya on 17.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectEditingViewControllerAssembly {
    private lazy var modelAssembly = ObjectEditingModelAssembly()
    
    func objectEditingVC(index: Int) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ObjectEditingViewController") as! ObjectEditingViewController
        
        vc.model = modelAssembly.model(index: index)
        vc.model.output = vc

        return vc
    }
}
