//
//  BrandTableViewCell.swift
//  BMF
//
//  Created by Afiq Hamdan on 13/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

class BrandTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryImageview: UIImageView!
    @IBOutlet weak var cellContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        cellContentView.layer.cornerRadius = 15
        cellContentView.layer.shadowColor = UIColor.black.cgColor
        cellContentView.layer.shadowOpacity = 1
        cellContentView.layer.shadowOffset = CGSize.zero
        cellContentView.layer.shadowRadius = 5
//        cellContentView.layer.shadowPath = UIBezierPath(rect: cellContentView.bounds).cgPath
//        cellContentView.layer.shouldRasterize = true
//        cellContentView.layer.rasterizationScale = UIScreen.main.scale
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            self.selectionStyle = .none
        }

    }

    
}
