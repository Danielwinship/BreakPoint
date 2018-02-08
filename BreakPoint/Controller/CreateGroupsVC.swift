//
//  CreateGroupsVC.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/8/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {
    
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMemberLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doneButtonWasPressed(_ sender: Any) {
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
    }
    
    
    
    

 

}
