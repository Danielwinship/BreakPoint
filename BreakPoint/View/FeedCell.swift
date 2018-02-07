//
//  FeedCell.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/7/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String,content: String) {
        self.profileImage.image = profileImage
        self.emailLabel.text = email
        self.contentLabel.text = content
        
    }
    
}
