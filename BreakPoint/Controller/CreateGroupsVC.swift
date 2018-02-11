//
//  CreateGroupsVC.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/8/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupsVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMemberLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var emailArray = [String]()
    var chosenUserArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneButton.isHidden = true
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
        if titleTextField.text != "" && descriptionTextField.text != "" {
            DataService.instance.getIds(forUsernames: chosenUserArray, handler: { (idsArray) in
                var userIds = idsArray
                userIds.append((Auth.auth().currentUser?.uid)!)
                
                DataService.instance.createGroup(withTitle: self.titleTextField.text!, andDescription: self.descriptionTextField.text!, forUserIds: userIds, handler: { (groupCreated) in
                    if groupCreated {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print("Group could not be created")
                    }
                })
            })
        }
        
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
        if chosenUserArray.contains(emailArray[indexPath.row]){
                 cell.configureCell(profilemage: profileImage, email: emailArray[indexPath.row], isSelected: true)
        } else {
             cell.configureCell(profilemage: profileImage, email: emailArray[indexPath.row], isSelected: false)
        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !chosenUserArray.contains(cell.emailLabel.text!) {
            chosenUserArray.append(cell.emailLabel.text!)
            groupMemberLabel.text = chosenUserArray.joined(separator: ", ")
            doneButton.isHidden = false
        } else {
            chosenUserArray = chosenUserArray.filter({$0 != cell.emailLabel.text! })
            if chosenUserArray.count >= 1 {
                groupMemberLabel.text = chosenUserArray.joined(separator: ", ")
            } else {
                groupMemberLabel.text = "add people to your group"
                doneButton.isHidden = true
            }
        }
    }

}

extension CreateGroupsVC: UITextFieldDelegate{}
