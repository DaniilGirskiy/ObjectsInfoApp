//
//  ObjectCreationModel.swift
//  AVSOFT
//
//  Created by Danya on 06.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

protocol ObjectCreationModel {
    var output: ObjectCreationModelOutput? { get set }
    
    var objectAttributes: [ObjectAttribute] { get set }
    func addObject()
    
    func addObjectAttribute(attribute: ObjectAttribute)
}

protocol ObjectCreationModelOutput {
    func updateViewFromModel()
}

class ObjectCreationModelImpl: ObjectCreationModel {
    var output: ObjectCreationModelOutput?
    
    var storage: Storage! // injected!
    
    var objectAttributes: [ObjectAttribute] = [ObjectAttribute(attributeKey: "Full name",                                                                  attributeValue: ""),
                                               ObjectAttribute(attributeKey: "Passport number",                 attributeValue: ""),
                                               ObjectAttribute(attributeKey: "Telephone number",                attributeValue: "")]
    
    func addObject() {
        storage.addObjectToStorage(objectAttributes: objectAttributes)
    }
 
    
    func addObjectAttribute(attribute: ObjectAttribute) {
        objectAttributes.append(attribute)
        output?.updateViewFromModel()
    }
}

