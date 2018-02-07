//
//  CreatePostVC.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/7/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
       
    }

    
    
    @IBAction func sendButtonWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say something here..." {
            
            sendButton.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, foUID:(Auth.auth().currentUser?.uid)! , withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendButton.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendButton.isEnabled = true
                    print("There was an error")
                }
            })
        }
        
    }
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension CreatePostVC:UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
