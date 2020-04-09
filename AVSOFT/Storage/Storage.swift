//
//  Storage.swift
//  AVSOFT
//
//  Created by Danya on 05.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

protocol Storage {
    var outputForObjectListModel: StorageOutput? { get set }
    var outputForObjectEditingModel: StorageOutput? { get set }
    var outputForObjectsReviewModel: StorageOutput? { get set }
    
    func getDataForObjectListModel()
    func getDataForObjectEditingModel()
    func getDataForObjectsReviewModel()
    
    func addObjectToStorage(objectAttributes: [ObjectAttribute])
    func deleteObjectFromStorage(at index: Int)
    func changeObjectAttributesInStrorage(objectIndex: Int, newAttributes: [ObjectAttribute])
}

protocol StorageOutput {
    func collectionChanged(newValue: [StorageObject])
}

class StorageImpl: Storage {
    var outputForObjectListModel: StorageOutput?
    var outputForObjectEditingModel: StorageOutput?
    var outputForObjectsReviewModel: StorageOutput?
    
    var storageObjects: [StorageObject] = []
    
    func getDataForObjectListModel() {
        outputForObjectListModel?.collectionChanged(newValue: storageObjects)
    }
    
    func getDataForObjectEditingModel() {
        outputForObjectEditingModel?.collectionChanged(newValue: storageObjects)
    }
    
    func getDataForObjectsReviewModel() {
        outputForObjectsReviewModel?.collectionChanged(newValue: storageObjects)
    }
    
    func addObjectToStorage(objectAttributes: [ObjectAttribute]) {
        storageObjects.append(StorageObject(attributes: objectAttributes))
        
        writeDataToTxtFile()
        outputForObjectListModel?.collectionChanged(newValue: storageObjects)
    }
    
    func deleteObjectFromStorage(at index: Int) {
        storageObjects.remove(at: index)
        
        writeDataToTxtFile()
        outputForObjectListModel?.collectionChanged(newValue: storageObjects)
    }

    func changeObjectAttributesInStrorage(objectIndex: Int, newAttributes: [ObjectAttribute]) {
        storageObjects[objectIndex] = StorageObject(attributes: newAttributes)
        
        writeDataToTxtFile()
        outputForObjectListModel?.collectionChanged(newValue: storageObjects)
        outputForObjectEditingModel?.collectionChanged(newValue: storageObjects)
        outputForObjectsReviewModel?.collectionChanged(newValue: storageObjects)
    }
    
    private func writeDataToTxtFile() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let filename = paths[0].appendingPathComponent("objectsInformation.txt")
        var str = ""
        
        for object in storageObjects{
            for attribute in object.attributes {
                str += "\(attribute.attributeKey) - \(attribute.attributeValue)\n"
                do {
                    try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    print("error")
                }
            }
            str += "\n"
        }
    }
}
