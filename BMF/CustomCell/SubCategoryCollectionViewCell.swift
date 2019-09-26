//
//  BrandCollectionViewCell.swift
//  BMF
//
//  Created by Afiq Hamdan on 10/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

class SubCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var seeAllButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        brandImageView.layer.cornerRadius = 10
//        self.contentView.backgroundColor = .green //cell color , uncomment for debugging
//        self.mainView.backgroundColor = .white
        self.mainView.layer.cornerRadius = 10
        self.mainView.layer.borderWidth = 0.5
        self.mainView.layer.borderColor = UIColor.white.cgColor
        
        //disable button interaction
        seeAllButton.isUserInteractionEnabled = false
        seeAllButton.layer.cornerRadius = 15
    
    }

    func stylingCell() {
        //        self.contentView.layer.borderWidth = 1.0
        //        self.contentView.layer.borderColor = UIColor.clear.cgColor
        //        self.contentView.layer.masksToBounds = false
        //        self.layer.shadowColor = UIColor.gray.cgColor
        //        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        //        self.layer.shadowRadius = 4.0
        //        self.layer.shadowOpacity = 1.0
        //        self.layer.masksToBounds = false
        //        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
}
