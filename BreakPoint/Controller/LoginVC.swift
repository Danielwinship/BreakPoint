//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/4/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailField: InsetTextField!
    
    @IBOutlet weak var passwordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        
    }

    @IBAction func signInButtonWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(loginError?.localizedDescription as Any)
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            if success {
                                self.dismiss(animated: true, completion: nil)
                            }
                        })
                    } else {
                        print(registrationError?.localizedDescription as Any)
                    }
                })
            })
        }
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension LoginVC:UITextFieldDelegate {}
