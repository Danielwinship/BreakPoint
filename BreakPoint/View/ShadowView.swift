//
//  ShadowView.swift
//  BreakPoint
//
//  Created by Daniel Winship on 2/4/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        super.awakeFromNib()
    }

    
}
