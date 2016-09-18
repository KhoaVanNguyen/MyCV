//
//  FirstViewController.swift
//  My
//
//  Created by Khoa on 9/17/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var jobHiddenLbl: UILabel!
    @IBOutlet weak var introduceHiddenLbl: UILabel!
    @IBOutlet weak var avatarImg: CustomAvatar!
    @IBOutlet weak var helloLbl: UILabel!
    
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        resetValues()
        
        helloLbl.center.y -= view.bounds.height
        avatarImg.center.y += view.bounds.height
        
        introduceHiddenLbl.alpha = 0
        jobHiddenLbl.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0, animations: {
            self.helloLbl.center.y += self.view.bounds.height
            }, completion: {
                finished in
                self.imageAnimation()
        })
        
        UIView.animate(withDuration: 2.0, delay: 0.5, options: [], animations: {
            self.view.backgroundColor = UIColor.yellow
            }, completion: {
                finished in
                self.showHiddenLbl()
        })
    }
    
    func imageAnimation(){
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
            self.avatarImg.center.y -= self.view.bounds.height
        })
    }
    func showHiddenLbl(){
        UIView.animate(withDuration: 2.5, animations: {
            self.avatarImg.alpha = 0
            self.view.backgroundColor = UIColor.black
            }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
            self.introduceHiddenLbl.alpha = 1
        })
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
            self.jobHiddenLbl.alpha = 1
            }, completion: {
                finished in
                self.changeJobTitle()
        })
        
    }
    func changeJobTitle(){
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(HomeVC.processTimer), userInfo: nil, repeats: true)
    }
    func processTimer(){
        let jobs = ["Student", "Blogger", "Online Teacher","Bookaholic"]
        let random = Int(arc4random_uniform(4))
        jobHiddenLbl.text = jobs[random]
    }
    func resetValues(){
        timer.invalidate()
        avatarImg.alpha = 1
    }
}

