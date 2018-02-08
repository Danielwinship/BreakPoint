//
//  FirstViewController.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/2/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var messagesArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messagesArray = returnedMessagesArray.reversed()
            self.tableView.reloadData()
        }

    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
//                       self.messagesArray = returnedMessagesArray
//                       self.tableView.reloadData()
//    }
//}
    
    
}

extension FeedVC:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else{return UITableViewCell()}
        let image = UIImage.init(named: "defaultProfileImage")
        let message = messagesArray[indexPath.row]
        DataService.instance.getUserName(forUID: message.senderId) { (returnedUsername) in
             cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
        
        return cell
    }
}

