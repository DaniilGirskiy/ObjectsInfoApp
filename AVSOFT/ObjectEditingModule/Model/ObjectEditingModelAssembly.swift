//
//  ObjectEditingModelAssembly.swift
//  AVSOFT
//
//  Created by Danya on 17.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class ObjectEditingModelAssembly {
    private lazy var storageAssembly = StorageAssembly()
    
    func model(index: Int) -> ObjectEditingModel {
        let model = ObjectEditingModelImpl()
        model.storage = storageAssembly.storage
        model.storage.outputForObjectEditingModel = model 
        model.objectIndex = index
        return model
    }
    
}
