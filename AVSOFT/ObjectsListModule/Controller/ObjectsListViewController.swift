//
//  ObjectsListViewController.swift
//  AVSOFT
//
//  Created by Danya on 05.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectsListViewController: UIViewController {
    
    //MARK: - Properties
    
    var tableView: UITableView!
    
    var model: ObjectsListModel! // injected
    var router: ObjectsListRouter! // injected

    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureTableView()
        
        model.load()
    }
    
    
    // MARK: - Helper Functions
    
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Objects"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ObjectsListCell.self, forCellReuseIdentifier: ObjectsListCell.reuseID)
         
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 100
        tableView.backgroundColor = .clear
        
    }
    
    @objc func dismissButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonPressed() {
        router.show(in: self)
    }

}

extension ObjectsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = editAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete, edit])
    }
    
    func editAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Edit") { (action, view, completion) in
            self.router.show(in: self, with: indexPath.row)
            completion(true)
        }
        return action
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.model.deleteObjectFromStorage(at: indexPath.row)
            completion(true)
        }
        return action
    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.presentationObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ObjectsListCell.reuseID,
                                                 for: indexPath) as! ObjectsListCell
        cell.fullNameLabel.text = model.presentationObjects[indexPath.row].fullName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        router.show(in: self, with: indexPath.row)
    }
    
}

extension ObjectsListViewController: ObjectsListModelOutput {
    func updateViewFromModel() {
        tableView.reloadData()
        print("Object List View updated from model")
    }
}
