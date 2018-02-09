//
//  UserCell.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/9/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
