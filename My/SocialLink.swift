//
//  SocialLink.swift
//  MyCV
//
//  Created by Khoa on 9/21/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import Foundation

class SocialLink{
    private var _socialName : String!
    private var _socialLink : String!
    private var _imageName : String!
    
    var socialName : String{
        get {
            return _socialName
        }
    }
    
    var socialLink : String{
        get {
            return _socialLink
        }
    }
    var imageName : String{
        get {
            return _imageName
        }
    }
    
    init(name : String, link : String, imageName : String) {
        _socialName = name
        _socialLink = link
        _imageName = imageName
    }
}











