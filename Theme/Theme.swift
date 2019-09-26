//
//  Theme.swift
//  BMF
//
//  Created by Afiq Hamdan on 21/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit
import Foundation

enum Theme: Int {
    case normalMode
    case darkMode
    
    var mainColor: UIColor {
        switch self {
        case .normalMode:
            return UIColor().colorFromHexString("ffffff")
        case .darkMode:
            return UIColor().colorFromHexString("000000")

        }
    }
    
    //Customizing the Navigation Bar
    var navBarStyle: UIBarStyle {
        switch self {
        case .normalMode:
            return UIBarStyle.default
        case .darkMode:
            return UIBarStyle.black
            
        }
    }
    
    var navBarTintColor: UIColor {
        switch self {
        case .normalMode:
            return Constant.boldColor
        case .darkMode:
            return Constant.darkColor
        }
    }
    
    var tintColor: UIColor {
        switch self {
        case .normalMode:
            return Constant.darkColor
        case .darkMode:
            return Constant.lightColor
        }
    }
    
    //Customizing background color
    var backgroundColor: UIColor {
        switch self {
        case .normalMode:
            return Constant.boldColor
        case .darkMode:
            return Constant.darkColor
        }
    }
    
    var titleTextColor: UIColor {
        switch self {
        case .normalMode:
            return Constant.darkerColor
        case .darkMode:
            return Constant.boldColor
        }
    }
    
    var tabBarTintColor: UIColor {
        switch self {
        case .normalMode:
            return UIColor().colorFromHexString("2980b9")
        case .darkMode:
            return UIColor().colorFromHexString("2980b9")
        }
    }
    
    var unselectedTabBarTintColor: UIColor {
        switch self {
        case .normalMode:
            return UIColor.gray
        case .darkMode:
            return UIColor.gray
        }
    }
    
    var buttonBackgroundColor: UIColor {
        switch self {
        case .normalMode:
            return Constant.darkerColor
        case .darkMode:
            return Constant.boldColor
        }
    }
    
    var buttonTextColor: UIColor {
        switch self {
        case .normalMode:
            return Constant.boldColor
        case .darkMode:
            return Constant.darkColor
        }
    }
    
    var collectionViewTextColor: UIColor {
        switch self {
        case .normalMode:
            return Constant.darkColor
        case .darkMode:
            return Constant.darkColor
        }
    }
    

}
