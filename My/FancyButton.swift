//
//  FancyButton.swift
//  MyCV
//
//  Created by Khoa on 9/21/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class FancyButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 92/255, green: 140/255, blue: 160/255, alpha: 1).cgColor
    }

}
