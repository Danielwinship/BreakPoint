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
        
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension LoginVC:UITextFieldDelegate {}
