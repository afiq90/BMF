//
//  ListBrandViewController.swift
//  BMF
//
//  Created by Afiq Hamdan on 11/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

class ListBrandViewController: UIViewController {
    
    var muslimBrands: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Senarai Pasaraya Dan Runcit"
        print("ListBrandViewController brands = \(muslimBrands)")

        createPageControlWithImage(.horizontal)
    }
    
    // testing function for uiimage
    fileprivate func createPageControlWithImage(_ rotation: rotationWay){
        
        let _image1: UIImage = UIImage(named:"PasarayaRuncit1")!
        let _image2: UIImage = UIImage(named:"PasarayaRuncit2")!
        let _image3: UIImage = UIImage(named:"PasarayaRuncit3")!
        let _image4: UIImage = UIImage(named:"PasarayaRuncit4")!
        let _image5: UIImage = UIImage(named:"PasarayaRuncit5")!
        let _image6: UIImage = UIImage(named:"PasarayaRuncit6")!
        let _image7: UIImage = UIImage(named:"PasarayaRuncit7")!

        let imageArray: [UIImage] = [_image1, _image2, _image3, _image4, _image5, _image6, _image7]
        
        let pageControl: AFPageControl = AFPageControl(frame: CGRect(), imageArray: imageArray, rotation);
        pageControl.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        let horizontalConstraint = NSLayoutConstraint(item: pageControl, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
//        let verticalConstraint = NSLayoutConstraint(item: pageControl, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
//        let widthConstraint = NSLayoutConstraint(item: pageControl, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
//        let heightConstraint = NSLayoutConstraint(item: pageControl, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 100)
        
        view.addSubview(pageControl)

//        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

    }
}
