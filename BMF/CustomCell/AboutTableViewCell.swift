//
//  AboutTableViewCell.swift
//  BMF
//
//  Created by Afiq Hamdan on 15/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var aboutTitle: UILabel!
    @IBOutlet weak var aboutImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        styleUIComponent()

        NotificationCenter.default.addObserver(self, selector: #selector(darkModeEnabled(_:)), name: Notification.Name("darkModeEnabled"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(normalModeEnabled(_:)), name: Notification.Name("normalModeEnabled"), object: nil)
    }
    
    @objc private func darkModeEnabled(_ notification: Notification) {
        print("category cell darkModeEnabled")
        ThemeManager.applyTheme(theme: .darkMode)
        Constant.applyThemeForTableViewCell(with: aboutView)
    }
    
    @objc private func normalModeEnabled(_ notification: Notification) {
        print("category cell normalModeEnabled")
        ThemeManager.applyTheme(theme: .normalMode)
        Constant.applyThemeForTableViewCell(with: aboutView)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            self.selectionStyle = .none
        }
    }
    
    func styleUIComponent() {
    
        aboutView.layer.cornerRadius = 15
        aboutView.layer.shadowColor = UIColor.black.cgColor
        aboutView.layer.shadowOpacity = 0.6
        aboutView.layer.shadowOffset = CGSize.zero
        aboutView.layer.shadowRadius = 2
        //        aboutView.layer.shadowPath = UIBezierPath(rect: aboutView.bounds).cgPath
        //        aboutView.layer.shouldRasterize = true
        //        aboutView.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("darkModeEnabled"), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("normalModeEnabled"), object: nil)
        
    }
}
