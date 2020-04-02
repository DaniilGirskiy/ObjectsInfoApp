//
//  StorageAssembly.swift
//  AVSOFT
//
//  Created by Danya on 05.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class StorageAssembly {                             // singletone
    private static let storage = StorageImpl()
    
    var storage: Storage {
        return StorageAssembly.storage
    }
}
