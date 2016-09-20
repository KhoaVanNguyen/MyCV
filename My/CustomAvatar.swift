//
//  RoundedImage.swift
//  MyCV
//
//  Created by Khoa on 9/17/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
@IBDesignable
class CustomAvatar: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    func setup(){
      
       // layer.cornerRadius = layer.bounds.width / 2
        layer.borderWidth = 5.0
        layer.borderColor = UIColor.white.cgColor
        layer.masksToBounds = true
        layer.shadowRadius = 0.4
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize.zero

    }
}
