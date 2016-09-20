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
        setup()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //layer.cornerRadius = self.frame.width / 2
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    func setup(){
        layer.masksToBounds = true
        layer.cornerRadius = layer.bounds.width / 2
        layer.shadowRadius = 0.4
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize.zero

    }
}
