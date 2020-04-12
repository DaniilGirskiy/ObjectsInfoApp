//
//  LoginViewController.swift
//  AVSOFT
//
//  Created by Danya on 26.02.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var router: LoginRouter! // injected
    var authService: AuthenticationService! // injected

    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        errorLabel.isHidden = true
        
        authService.retrieveValues() // load all usernames/passwords
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
//    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        if username != "" && password != "" {
            if authService.verifyAuthenticity(username: username, password: password) {
                router.show(in: self)
            } else {
                errorLabel.text = "Please check the data entry is correct!"
                errorLabel.isHidden = false
            }
        } else {
            errorLabel.text = "Please fill in all fields!"
            errorLabel.isHidden = false
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        router.showSignUpModule(in: self)
    }
    
    private func clear() {
        usernameTextField.text = ""
        passwordTextField.text = ""
        errorLabel.isHidden = true
        topView.reset()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.text != "" {
            if textField == usernameTextField {
                topView.animate(start: 0)
            } else {
                topView.animate(start: 1/2)
            }
        }
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == usernameTextField && textField.text != "" {
            topView.animate(start: 0)
        } else if textField.text != "" {
            topView.animate(start: 1/2)
        }
    }
    
}



