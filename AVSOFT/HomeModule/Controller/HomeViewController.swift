//
//  HomeViewController.swift
//  AVSOFT
//
//  Created by Danya on 26.02.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate {
    func toggleMenu(forMenuOption menuOption: MenuOption?)
}

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: HomeViewControllerDelegate?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        
        configureNavigationBar()
    }
    
    // MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.toggleMenu(forMenuOption: nil)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.title = "Home page"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "more").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}
