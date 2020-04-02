//
//  ObjectEditingModel.swift
//  AVSOFT
//
//  Created by Danya on 17.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

protocol ObjectEditingModel {
    func addObjectAttribute(attribute: ObjectAttribute)
    
    var output: ObjectEditingModelOutput? { get set }
    
    var objectAttributes: [ObjectAttribute] { get set }
    
    func load()

    func changeObjectAttribute(at index: Int, newValue: String)
}

protocol ObjectEditingModelOutput {
    func updateViewFromModel()
}

class ObjectEditingModelImpl: ObjectEditingModel {
    var output: ObjectEditingModelOutput?
    
    var storage: Storage! // injected!
    var objectIndex: Int! // injected from router!
    var objectAttributes: [ObjectAttribute] = []
    
    func changeObjectAttribute(at index: Int, newValue: String) {
        var newObjectAttributes: [ObjectAttribute] = []
        
        for attributeIndex in 0..<objectAttributes.count {
            attributeIndex == index ? newObjectAttributes.append(ObjectAttribute(attributeKey: objectAttributes[index].attributeKey,
                                                                                 attributeValue: newValue)) : newObjectAttributes.append(objectAttributes[attributeIndex])
        }
        storage.changeObjectAttributesInStrorage(objectIndex: objectIndex, newAttributes: newObjectAttributes)
    }
    
    func addObjectAttribute(attribute: ObjectAttribute) {
        storage.changeObjectAttributesInStrorage(objectIndex: objectIndex,
                                                 newAttributes: objectAttributes + [attribute])
    }
    
    
    func load() {
        storage.getDataForObjectEditingModel()
    }
}

extension ObjectEditingModelImpl: StorageOutput {
    func collectionChanged(newValue: [StorageObject]) {
        objectAttributes = newValue[objectIndex].attributes
        output?.updateViewFromModel()
    }
}
