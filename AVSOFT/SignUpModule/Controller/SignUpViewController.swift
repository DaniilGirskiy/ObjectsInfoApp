//
//  SignUpViewController.swift
//  AVSOFT
//
//  Created by Danya on 10.04.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    var authService: AuthenticationService! // injected
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var firstPasswordTextField: UITextField!
    @IBOutlet weak var secondPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var warningImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        loginTextField.delegate = self
        firstPasswordTextField.delegate = self
        secondPasswordTextField.delegate = self
        
        errorLabel.isHidden = true
        warningLabel.isHidden = true
        warningImage.isHidden = true
    
    }
    
    private func configureUI() {
        navigationItem.title = "Create Account"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonPressed))
    }
    
    @objc func closeButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loginTextField.resignFirstResponder()
        firstPasswordTextField.resignFirstResponder()
        secondPasswordTextField.resignFirstResponder()
    }

    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        
        let login = loginTextField.text!
        let firstPassword = firstPasswordTextField.text!
        let secondPassword = secondPasswordTextField.text!
        
        if login != "" && firstPassword != "" && secondPassword != "" {
            if firstPassword == secondPassword && authService.enteredValueIsFree(input: login) {
                
                authService.save(username: login, password: firstPassword)
                
                let alert = UIAlertController(title: "Congratulations!",
                                              message: "Your account has been created successfully",
                                              preferredStyle: .alert)
    
                let doneButton = UIAlertAction(title: "Done", style: .cancel) { (_) in
                    self.dismiss(animated: true, completion: nil)
                }
                
                alert.addAction(doneButton)
                present(alert, animated: true, completion: nil)
              
            } else {
                errorLabel.text = "Please enter data again!"
                errorLabel.isHidden = false
            }
        } else {
            errorLabel.text = "Please fill in all fields!"
            errorLabel.isHidden = false
        }
        
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == loginTextField {
            if textField.text != "" {
                if authService.enteredValueIsFree(input: textField.text!) {
                    warningLabel.text = "is free"
                    warningLabel.textColor = .green
                    warningImage.image = UIImage(systemName: "checkmark.seal.fill")
                    warningImage.tintColor = .green
                } else {
                    warningLabel.text = "is taken"
                    warningLabel.textColor = .red
                    warningImage.image = UIImage(systemName: "exclamationmark.triangle.fill")
                    warningImage.tintColor = .red
                }
                
                warningLabel.isHidden = false
                warningImage.isHidden = false
            } else {
                warningLabel.isHidden = true
                warningImage.isHidden = true
            }
        }
    }
    
    
}
