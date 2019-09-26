//
//  UIViewControllerExtensions.swift
//  BMF
//
//  Created by Afiq Hamdan on 14/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(message: String) {
        var newMessage = ""
        
        if message == "The Internet connection appears to be offline." {
            newMessage = "Sila pastikan anda mempunyai sambungan internet untuk menggunakan aplikasi ini 👌🏻"
        }
        
        let alert = UIAlertController(title: "No Internet", message: newMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertForEmail() {
        let alert = UIAlertController(title: "Unable to use Mail", message: "Do you have your iOS Mail set up properly? If not or if you're using a different email application, the email address is afiqthedeveloper@gmail.com", preferredStyle: .alert)
        let copyEmailAction = UIAlertAction(title: "Copy Email", style: .default) {(action) in
            UIPasteboard.general.string = "afiqthedeveloper@gmail.com"
        }
    
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(copyEmailAction)
        alert.addAction(alertAction)

        self.present(alert, animated: true, completion: nil)
        
    }
}
