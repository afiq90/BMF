//
//  CategoryTableViewCell.swift
//  BMF
//
//  Created by Afiq Hamdan on 10/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryDescription: UILabel!
    @IBOutlet weak var categoryImageview: UIImageView!
    @IBOutlet weak var cellContentView: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.cellContentView.layer.cornerRadius = 15
        cellContentView.layer.shadowColor = UIColor.black.cgColor
        cellContentView.layer.shadowOpacity = 0.6
        cellContentView.layer.shadowOffset = CGSize.zero
        cellContentView.layer.shadowRadius = 5
//        cellContentView.layer.shadowPath = UIBezierPath(rect: cellContentView.bounds).cgPath
//        cellContentView.layer.shouldRasterize = true
//        cellContentView.layer.rasterizationScale = UIScreen.main.scale

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected {
            self.selectionStyle = .none
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
//        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))

    }
    
}
