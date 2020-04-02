//
//  ObjectsReviewModelAssembly.swift
//  AVSOFT
//
//  Created by Danya on 24.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class ObjectsReviewModelAssembly {
    private lazy var storageAssembly = StorageAssembly()
    
    var model: ObjectsReviewModel {
        let model = ObjectsReviewModelImpl()
        model.storage = storageAssembly.storage
        model.storage.outputForObjectsReviewModel = model
        return model
    }
    
}
