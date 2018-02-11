//
//  GroupCell.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/11/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    //Outlets
    
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var groupDescriptionLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(title:String, description:String, memberCount:Int) {
        self.groupTitleLabel.text = title
        self.groupDescriptionLabel.text = description
        self.memberCountLabel.text = "\(memberCount) members"
    }

}
