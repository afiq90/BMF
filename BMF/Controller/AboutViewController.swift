//
//  AboutViewController.swift
//  BMF
//
//  Created by Afiq Hamdan on 15/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit
import MessageUI

class AboutViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var aboutTableView: UITableView!
    @IBOutlet weak var appVersionLabel: UILabel!
    
    //TODO: Create a tableView Setting. need to have two section (Dark Mode and Reach out)
    
    var aboutMeArray = [About]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let version = Constant.appVersion {
            appVersionLabel.text = "Version \(version)"
        }
        setupAboutModel()
        setupTableView()
    }
    
    func setupAboutModel() {
//        let author = About(title: "Author", logo: UIImage(named: "profile")!)
        let email = About(title: "Email", logo: UIImage(named: "email")!)
        let facebook = About(title: "Facebook", logo: UIImage(named: "facebook")!)
        let twitter = About(title: "Twitter", logo: UIImage(named: "twitter")!)

        aboutMeArray.append(email)
//        aboutMeArray.append(author)
        aboutMeArray.append(facebook)
        aboutMeArray.append(twitter)
    }


    func setupTableView() {
        let aboutCustomCell = UINib(nibName: "AboutTableViewCell", bundle: nil)
        aboutTableView.register(aboutCustomCell, forCellReuseIdentifier: "aboutCell")
    }
    
}

extension AboutViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutMeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aboutCell", for: indexPath) as! AboutTableViewCell
        let aboutMe = aboutMeArray[indexPath.row]
        cell.aboutTitle.text = aboutMe.title
        cell.aboutImageView.image = aboutMe.logo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let email = "afiqthedeveloper@gmail.com"
//        if let url = URL(string: "mailto:\(email)") {
//            if #available(iOS 10.0, *) {
//                UIApplication.shared.open(url)
//            } else {
//                UIApplication.shared.openURL(url)
//            }
//        }
       
        if MFMailComposeViewController.canSendMail() {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self
            mailComposerVC.setToRecipients(["afiqthedeveloper@gmail.com"])
            mailComposerVC.setSubject("Sending you an in-app e-mail...")
            mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)

            self.present(mailComposerVC, animated: true, completion: {() -> Void in })
        } else {
            self.showAlertForEmail()
        }
        
        
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Swift.Error?){
        controller.dismiss(animated: true) { () -> Void in }
    }
}
