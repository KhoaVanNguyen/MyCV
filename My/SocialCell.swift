//
//  SocialCell.swift
//  MyCV
//
//  Created by Khoa on 9/21/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class SocialCell: UITableViewCell {

    @IBOutlet weak var socialLinkLbl: UILabel!
    @IBOutlet weak var socialNameLbl: UILabel!
    @IBOutlet weak var socialImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    func configureCell(socialLink : SocialLink){
        socialLinkLbl.text = socialLink.socialLink
        socialNameLbl.text = socialLink.socialName
        socialImage.image = UIImage(named: socialLink.imageName)
    }

}
