//
//  ContactVC.swift
//  MyCV
//
//  Created by Khoa on 9/21/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class MoreVC: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var socialLinks = [SocialLink]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        createSocialLinksData()
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return socialLinks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SocialCell", for: indexPath) as?
            SocialCell{
            cell.configureCell(socialLink: socialLinks[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowWebsite", sender: socialLinks[indexPath.row].socialLink)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ShowWebsiteVC{
            if let link = sender as? String{
                destinationVC.url = link
            }
        }
    }
    func createSocialLinksData(){
        let fb = SocialLink(name: "Facebook", link: "http://fb.com/1thegioi", imageName: "facebook.png")
        let twitter = SocialLink(name: "Twitter", link: "http://twitter.com/KhoaNguyen08", imageName: "twitter.png")
        let youtube = SocialLink(name: "Youtube", link: "http://www.youtube.com/c/NIVIKICOM-GO", imageName: "youtube.png")
        let website = SocialLink(name: "Website", link: "http://niviki.com", imageName: "website.png")
        let course = SocialLink(name: "Khóa học hướng đối tượng C++ Udemy", link: "https://www.udemy.com/lap-trinh-huong-doi-tuong-c-co-ban-den-nang-cao/", imageName: "oop banner.jpg")
        let mybookList = SocialLink(name: "My Booklist", link: "http://niviki.com/my-booklist/", imageName: "mybook.jpg")
        socialLinks.append(contentsOf: [website,youtube, course, mybookList ,fb, twitter ])
    }
    
}






