//
//  SecondViewController.swift
//  My
//
//  Created by Khoa on 9/17/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class MyResumeVC: UIViewController {

    @IBOutlet weak var acceptBtn : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func acceptBtnPressed(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Thank You", message: "Khoa accepted your friend request", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.acceptBtn.isHidden = true
        }
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }

    @IBAction func inboxBtnPressed(_ sender: AnyObject) {
        self.tabBarController?.selectedIndex = 2
    }

}

