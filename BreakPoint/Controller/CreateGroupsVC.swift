//
//  CreateGroupsVC.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/8/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMemberLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var emailArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }

   @objc func textFieldDidChange() {
        if emailSearchTextField.text == "" {
            emailArray.removeAll()
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSeachQuery: emailSearchTextField.text!, handler: { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            })
        }
    }

    
    
    @IBAction func doneButtonWasPressed(_ sender: Any) {
        
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    

 

}

extension CreateGroupsVC:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else {return UITableViewCell()}
        
        let profileImage = UIImage(named: "defaultProfileImage")!
        
        cell.configureCell(profilemage: profileImage, email: emailArray[indexPath.row], isSelected: true)
        return cell
    }
    

}

extension CreateGroupsVC: UITextFieldDelegate{}
