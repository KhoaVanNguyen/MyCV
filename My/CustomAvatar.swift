//
//  RoundedImage.swift
//  MyCV
//
//  Created by Khoa on 9/17/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class CustomAvatar: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 8
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //layer.cornerRadius = self.frame.width / 2
    }

}
