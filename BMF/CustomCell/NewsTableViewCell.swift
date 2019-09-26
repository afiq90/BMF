//
//  NewsTableViewCell.swift
//  BMF
//
//  Created by Afiq Hamdan on 15/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var newsView: UIView!


    var newsOriginalLink = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        styleUIComponent()
    
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected {
            self.selectionStyle = .none
        }
    }
    
    func styleUIComponent() {
        
        readButton.layer.cornerRadius = 10
        readButton.isUserInteractionEnabled = false
        
        newsView.layer.cornerRadius = 20
        newsView.layer.shadowColor = UIColor.black.cgColor
        newsView.layer.shadowOpacity = 0.6
        newsView.layer.shadowOffset = CGSize.zero
        newsView.layer.shadowRadius = 4
//        newsView.layer.shadowPath = UIBezierPath(rect: newsView.bounds).cgPath
//        newsView.layer.shouldRasterize = true
//        newsView.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        let url = URL(string: newsOriginalLink)
        if let newsURL = url {
            UIApplication.shared.open(newsURL, options: [:], completionHandler: nil)
        }
    }
    
}
