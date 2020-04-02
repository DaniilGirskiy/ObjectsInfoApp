//
//  ObjectsReviewViewController.swift
//  AVSOFT
//
//  Created by Danya on 24.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectsReviewViewController: UIViewController {
    var model: ObjectsReviewModel! // injected
    var router: ObjectsReviewRouter! // injected
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model.load()
        
        configureUI()
        configureTableView()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Objects Information"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissButtonPressed))
    }
    
    @objc func dismissButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
       
        tableView.rowHeight = 100
        tableView.sectionHeaderHeight = 50
        tableView.separatorStyle = .none
    }
    
}

extension ObjectsReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myHeader") as! ObjectsReviewHeaderCell
        cell.headerLabel.text = "Object \(section + 1)"
        cell.editButtonPressed = {
            print("show edit module")
            self.router.show(in: self, with: section)
        }
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.objects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.objects[section].attributes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ObjectsReviewCell
        cell.attributeKeyLabel.text = model.objects[indexPath.section].attributes[indexPath.row].attributeKey
        cell.attributeValueLabel.text = model.objects[indexPath.section].attributes[indexPath.row].attributeValue
        
        return cell
    }
}

extension ObjectsReviewViewController: ObjectsReviewModelOutput {
    func updateViewFromModel() {
        print("Object Review View updated from model")
        tableView.reloadData()
    }
    
}
