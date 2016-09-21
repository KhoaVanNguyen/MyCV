//
//  DegreesToRadians.swift
//  MyCV
//
//  Created by Khoa on 9/21/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import Foundation
import UIKit
let π = CGFloat(M_PI)

func DegreesToRadians (_ value:CGFloat) -> CGFloat {
    return value * π / 180.0
}

func RadiansToDegrees (_ value:CGFloat) -> CGFloat {
    return value * 180.0 / π
}
