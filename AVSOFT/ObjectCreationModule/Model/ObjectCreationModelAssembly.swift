//
//  ObjectCreationModelAssembly.swift
//  AVSOFT
//
//  Created by Danya on 06.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class ObjectCreationModelAssembly {
    private lazy var storageAssembly = StorageAssembly()
    
    var model: ObjectCreationModel {
        let model = ObjectCreationModelImpl()
        model.storage = storageAssembly.storage
        return model
    }
    
}
