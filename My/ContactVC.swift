//
//  ContactVC.swift
//  MyCV
//
//  Created by Khoa on 9/22/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
import MessageUI
class ContactVC: UIViewController, MFMailComposeViewControllerDelegate  {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func skypeBtnPressed(_ sender: AnyObject) {
        let installed = UIApplication.shared.canOpenURL(URL(string: "skype:")!)
        if installed {
            UIApplication.shared.openURL(URL(string: "skype:skype:vankhoa117?call")!)
            
        } else {
            
            UIApplication.shared.openURL(URL(string: "https://itunes.apple.com/in/app/skype/id304878510?mt=8")!)
        }
    }
    @IBAction func emailBtnPressed(_ sender: AnyObject) {
        let MailVC = configureEmail()
        if MFMailComposeViewController.canSendMail(){
            present(MailVC, animated: true, completion: nil)
        }else{
            showEmailAlert()
        }
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
    
    
    //MARK:- Functions
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
    
    func configureEmail() -> MFMailComposeViewController{
        let composeMailVC = MFMailComposeViewController()
        composeMailVC.setToRecipients(["vankhoa0603@gmail.com", "khoa@niviki.com"])
        composeMailVC.setSubject("Send From Khoa's CV App")
        composeMailVC.setMessageBody("\n Hello Khoa, \n Say something to Khoa", isHTML: false)
        composeMailVC.mailComposeDelegate = self
        return composeMailVC
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Mail canceled")
        case MFMailComposeResult.failed.rawValue:
            print("Mail failed")
        case MFMailComposeResult.saved.rawValue:
            print("Mail saved")
        case MFMailComposeResult.sent.rawValue:
            print("Mail sent")
        default:
            print("Unknow error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    func showEmailAlert(){
        let alert = UIAlertController(title: "Mail Setup Error", message: "You don't setup email account for Iphone", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Setup Email Account", style: .default) { (action) in
            let settingsUrl = URL(string: UIApplicationOpenSettingsURLString)
            if let url = settingsUrl {
                UIApplication.shared.openURL(url)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }

}
