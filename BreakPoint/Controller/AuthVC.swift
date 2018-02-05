//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/4/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func facebookSignInWasPressed(_ sender: Any) {
    }
    
    
    @IBAction func googleSignInWasPressed(_ sender: Any) {
    }
    
    

    
    @IBAction func signInWithEmailButtonWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
}
