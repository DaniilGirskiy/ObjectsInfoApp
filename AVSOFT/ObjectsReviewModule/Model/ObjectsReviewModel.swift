//
//  ObjectsReviewModel.swift
//  AVSOFT
//
//  Created by Danya on 24.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

protocol ObjectsReviewModel {
    var output: ObjectsReviewModelOutput? { get set }
    
    var objects: [PresentationObjectInformation] { get set }
    
    func load()
}

protocol ObjectsReviewModelOutput {
    func updateViewFromModel()
}

class ObjectsReviewModelImpl: ObjectsReviewModel {
    var output: ObjectsReviewModelOutput?
    
    var storage: Storage! // injected
    
    var objects: [PresentationObjectInformation] = []
    
    func load() {
        storage.getDataForObjectsReviewModel()
    }
}

extension ObjectsReviewModelImpl: StorageOutput {
    func collectionChanged(newValue: [StorageObject]) {
        objects = newValue.map({ (storageObject) -> PresentationObjectInformation in
            return PresentationObjectInformation(attributes: storageObject.attributes)
        })
        output?.updateViewFromModel()
    }
}
