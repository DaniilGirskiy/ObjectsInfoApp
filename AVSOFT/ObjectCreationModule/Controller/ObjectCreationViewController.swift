//
//  ObjectCreationViewController.swift
//  AVSOFT
//
//  Created by Danya on 06.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectCreationViewController: UIViewController {

    // MARK: - Properties
    
    var model: ObjectCreationModel! // injected!
   
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpTableView()
        
    }
    
    // MARK: - Handlers
    
    @objc func addButtonPressed() {
        configureAlert()
    }
    
    private func configureAlert() {
        let alert = UIAlertController(title: "Attention!",
                                          message: "Please choose what you want to do",
                                          preferredStyle: .actionSheet)
        
            let addAttributeButton = UIAlertAction(title: "Add attribute", style: .default) { (_) in
                let alert = UIAlertController(title: "Good!",
                                              message: "Please enter attribute name",
                                              preferredStyle: .alert)
                alert.addTextField { (textField) in
                    textField.placeholder = "Enter attribute name"
                }
                
                let addButton = UIAlertAction(title: "Add attribute!", style: .default) { (_) in
                    let input = alert.textFields![0].text ?? ""
                    self.model.addObjectAttribute(attribute: ObjectAttribute(attributeKey: input,                                                           attributeValue: ""))
                }
                
                let cancelButton = UIAlertAction(title: "Cancel",
                                                 style: .cancel,
                                                 handler: nil)
                alert.addAction(addButton)
                alert.addAction(cancelButton)
                self.present(alert, animated: true, completion: nil)
            }
            let addObjectButton = UIAlertAction(title: "Add object", style: .default) { (_) in
                self.model.addObject()
                self.navigationController?.popViewController(animated: true)
            }

            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            alert.addAction(addObjectButton)
            alert.addAction(addAttributeButton)
            alert.addAction(cancelButton)
            
            present(alert, animated: true, completion: nil)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Object Creation"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
}

extension ObjectCreationViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.objectAttributes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ObjectCreationViewCell
        cell.selectionStyle = .none
        
        let key = model.objectAttributes[indexPath.row].attributeKey
        cell.attributeLabel.text = key
        cell.inputTextField.tag = indexPath.row  // try closure!
        cell.inputTextField.delegate = self
        
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // last textField didn't save without return
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
////        print(textField.tag)
//
//        model.objectAttributes[textField.tag] = ObjectAttribute(attributeKey: model.objectAttributes[textField.tag].attributeKey,
//                                                                attributeValue: textField.text!)
//    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        model.objectAttributes[textField.tag] = ObjectAttribute(attributeKey: model.objectAttributes[textField.tag].attributeKey,
                                                                attributeValue: textField.text!)
    }
}

extension ObjectCreationViewController: ObjectCreationModelOutput {
    func updateViewFromModel() {
        tableView.reloadData()
        print("Object Creation View updated from model")
    }
}
