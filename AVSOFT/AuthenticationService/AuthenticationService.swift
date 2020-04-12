//
//  AuthenticationService.swift
//  AVSOFT
//
//  Created by Danya on 10.04.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit
import CoreData

protocol AuthenticationService {
    func save(username: String, password: String) // for sign up module
    
    func retrieveValues()
    
    func verifyAuthenticity(username: String, password: String) -> Bool
    
    func enteredValueIsFree(input: String) -> Bool
}

class AuthenticationServiceImpl: AuthenticationService {
    
    private var securityInformation = [String: String]()
    
    func verifyAuthenticity(username: String, password: String) -> Bool {
        return securityInformation[username] == password
    }
    
    func enteredValueIsFree(input: String) -> Bool {
        return securityInformation[input] == nil
    }
    
    func save(username: String, password: String) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            let context = appDelegate.persistentContainer.viewContext
            
            guard let entityDescription = NSEntityDescription.entity(forEntityName: "SecurityItem", in: context) else { return }
            
            let newValue = NSManagedObject(entity: entityDescription, insertInto: context)
            newValue.setValue(username, forKey: "username")
            newValue.setValue(password, forKey: "password")
            
            do {
                try context.save()
                securityInformation[username] = password
                print("Saved: \(username) - \(password)")
            } catch {
                print("Saving error")
            }
        }
    }
    
    func retrieveValues() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<SecurityItem>(entityName: "SecurityItem")
            
            do {
                let results = try context.fetch(fetchRequest)
                
                for result in results {
                    if let username = result.username, let password = result.password {
                        securityInformation[username] = password
                    }
                }
            } catch {
                print("Could not retrieve")
            }
            
        }
    }
    
    
}
