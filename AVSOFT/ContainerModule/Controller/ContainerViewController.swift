//
//  ContainerViewController.swift
//  AVSOFT
//
//  Created by Danya on 26.02.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    // MARK: - Properties
    
    var controller: UIViewController! 
    var menuViewController: MenuViewController!
    var isAppeared = false
    
    var router: ContainerRouter! // injected
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHomeViewController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isAppeared
    }
    
    // MARK: - Handlers
    
    func configureHomeViewController() {
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        controller = UINavigationController(rootViewController: homeViewController)

        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
    
    func configureMenuViewController() {
        if menuViewController == nil {
            menuViewController = MenuViewController()
            menuViewController.delegate = self
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            menuViewController.didMove(toParent: self)
            print("add menuViewController ")
        }
    }
    
    func animatePanel(shouldAppear: Bool, menuOption: MenuOption?) {
        if shouldAppear {
            // menu appears
            
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.controller.view.frame.origin.x = self.controller.view.frame.width - 140
            }) { (finished) in
                
            }
        } else {
            // menu disappears
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.controller.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
//        animateStatusBar()    
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .editing:
            print("Show editing")
            
            router.show(in: self) // editing router!
            
            
        case .review:
            print("Show review")
            
            router.showReview(in: self)
        case .programInformation:
            print("Show program information")
            
        case .logOut:
            print("Log Out")
            dismiss(animated: true, completion: nil)
        }
    }
    
    private func animateStatusBar() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
                        self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
}

extension ContainerViewController: HomeViewControllerDelegate {
    func toggleMenu(forMenuOption menuOption: MenuOption?) {
        configureMenuViewController()
        isAppeared = !isAppeared
        animatePanel(shouldAppear: isAppeared, menuOption: menuOption)
    }
}


