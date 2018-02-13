//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/12/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var sendBtnView: UIView!
    
    var group: Group?
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLabel.text = group?.groupTitle
        membersLabel.text = group?.members.joined(separator: ", ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
       
    }

    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonWasPressed(_ sender: Any) {
        
    }
    
}
