//
//  ContactVC.swift
//  MyCV
//
//  Created by Khoa on 9/22/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
class ContactVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func callBtnPressed(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Call Khoa", message: "Do you want to call 01647778186 (Khoa)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Call Now", style: .default) { (action) in
            self.callNumber()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    func callNumber(){
        if let url = URL(string: "tel://\(01647778186)") {
            UIApplication.shared.openURL(url)
        }
    }
    func sendEmail(){
        let email = "vankhoa0603@gmail.com"
        let url = URL(string: "mailto:\(email)")
        UIApplication.shared.openURL(url!)
    }
}
