//
//  ObjectsListModel.swift
//  AVSOFT
//
//  Created by Danya on 05.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

protocol ObjectsListModel {
    var output: ObjectsListModelOutput? { get set }
    
    func load()
    var presentationObjects: [PresentationObjectForList] { get set }
    func deleteObjectFromStorage(at index: Int)
}

protocol ObjectsListModelOutput {
    func updateViewFromModel()
}

class ObjectsListModelImpl: ObjectsListModel {
    var output: ObjectsListModelOutput?
    
    var storage: Storage! // injected
    
    var presentationObjects: [PresentationObjectForList] = []
    
    func load() {
        storage.getDataForObjectListModel()
    }
    
    func deleteObjectFromStorage(at index: Int) {
        storage.deleteObjectFromStorage(at: index)
    }
}

extension ObjectsListModelImpl: StorageOutput {
    func collectionChanged(newValue: [StorageObject]) {
        presentationObjects = newValue.map{ (storageObject) -> PresentationObjectForList in

            return PresentationObjectForList(fullName: storageObject.attributes[0].attributeValue)
        }
        self.output?.updateViewFromModel()
    }
    
}
