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
    
}
