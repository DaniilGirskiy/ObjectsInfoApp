//
//  ObjectEditingViewController.swift
//  AVSOFT
//
//  Created by Danya on 17.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectEditingViewController: UIViewController {
    
    // MARK: - Properties
    var model: ObjectEditingModel! // injected
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model.load()
        configureUI()
        setUpTableView()
    }
    
    
    // MARK: - Handlers

    @objc func addButtonPressed() {
        configureAlert()
    }

    private func configureAlert() {
        
        let alert = UIAlertController(title: "Attention!",
                                      message: "Please enter attribute name",
                                      preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter attribute name"
        }
        
        let addButton = UIAlertAction(title: "Add attribute key!", style: .default) { (_) in
            let inputKey = alert.textFields![0].text ?? ""
            // second alert
            
            let alert = UIAlertController(title: "Attention!",
                                          message: "Please enter value for \(inputKey):",
                                          preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "Enter attribute value"
            }
            
            let addButton = UIAlertAction(title: "Add attribute value!", style: .default) { (_) in
                let inputValue = alert.textFields![0].text ?? ""
                self.model.addObjectAttribute(attribute: ObjectAttribute(attributeKey: inputKey,                                                         attributeValue: inputValue))
            }
            
            let cancelButton = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: nil)
            alert.addAction(addButton)
            alert.addAction(cancelButton)
            self.present(alert, animated: true, completion: nil)
    
        }
        
        let cancelButton = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Object Editing"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    }

}


extension ObjectEditingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.objectAttributes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ObjectEditingViewCell
        
        let key = model.objectAttributes[indexPath.row].attributeKey
        let value = model.objectAttributes[indexPath.row].attributeValue
        
        cell.attributeKeyLabel.text = key
        cell.attributeValueLabel.text = value

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Attention!",
                                      message: "Please change \(model.objectAttributes[indexPath.row].attributeKey) value:",
                                      preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter attribute value"
        }
        
        
        let confirmButton = UIAlertAction(title: "Confirm", style: .default) { (_) in
            let input = alert.textFields![0].text ?? ""
            self.model.changeObjectAttribute(at: indexPath.row, newValue: input)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        
        alert.addAction(confirmButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension ObjectEditingViewController: ObjectEditingModelOutput {
    func updateViewFromModel() {
        tableView.reloadData()
        print("Object Editing View updated from model")
    }
}
