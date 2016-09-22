//
//  ShowWebsiteVC.swift
//  MyCV
//
//  Created by Khoa on 9/21/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class ShowWebsiteVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    private var _url : String!
    var url : String{
        get {
            if _url == nil{
                _url = "http://google.com"
            }
            return _url
        }
        set {
            _url = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlPath = URL(string: url)
        
        let urlRequest = URLRequest(url: urlPath!)
        webView.loadRequest(urlRequest)
    }
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    

}
