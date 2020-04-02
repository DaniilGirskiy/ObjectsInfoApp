//
//  ObjectsListModelAssembly.swift
//  AVSOFT
//
//  Created by Danya on 05.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class ObjectsListModelAssembly {
    private lazy var storageAssembly = StorageAssembly() // singletone
    
    var model: ObjectsListModel {
        let model = ObjectsListModelImpl()
        
        model.storage = storageAssembly.storage 
        model.storage.outputForObjectListModel = model
        return model
    }
}
