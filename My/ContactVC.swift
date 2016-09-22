//
//  ContactVC.swift
//  MyCV
//
//  Created by Khoa on 9/22/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
import MapKit
class ContactVC: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        // Do any additional setup after loading the view.
    }
}
