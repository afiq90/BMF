//
//  Constant.swift
//  BMF
//
//  Created by Afiq Hamdan on 12/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    
    static let categoryURL = "https://afiq90.github.io/BMF.Content/Category/Category.json"
    static let subcategoryURL = "https://afiq90.github.io/BMF.Content/SubCategory/"
    static let newsURL = "https://afiq90.github.io/BMF.Content/News/News.json"
    
    //Get app version and build number
    static let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
    static let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
//    static let buildString = "Version: \(appVersion ?? "").\(build ?? "")"
    
    static let blueColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
    static let yellowColor = UIColor(red: 255, green: 204, blue: 0, alpha: 1.0)
    
    //british pallate
    static let lightPurple = UIColor(red:156, green:136, blue:255, alpha:1.0)
    static let darkPurple = UIColor(red:140, green:122, blue:230, alpha:1.0)
    static let mazarineBlue = UIColor(red: 39, green: 60, blue: 117, alpha: 1)

    //Admob testUnitID
    static let testBannerUnitID = "ca-app-pub-3940256099942544/2934735716"
    static let testInterstitialUnitID = "ca-app-pub-3940256099942544/4411468910"
    static let testInterstitialVideoUnitID = "ca-app-pub-3940256099942544/5135589807"
    static let testRewardVideoUnitID = "ca-app-pub-3940256099942544/1712485313"
    static let testNativeUnitID = "ca-app-pub-3940256099942544/3986624511"
    static let testNativeVideoUnitID = "ca-app-pub-3940256099942544/2521693316"
    
    //Admob production unitID
    static let bannerUnitID = "ca-app-pub-8582584431754214/8041209182"

    //Colors
    static let
    darkColor     = #colorLiteral(red: 0.180, green: 0.235, blue: 0.266, alpha: 1),
    darkerColor   = #colorLiteral(red: 0.161, green: 0.208, blue: 0.235, alpha: 1),
    lightColor    = #colorLiteral(red: 0.964, green: 0.721, blue: 0.329, alpha: 1),
    linkColor     = #colorLiteral(red: 0.321, green: 0.901, blue: 0.882, alpha: 1),
    selectedColor = #colorLiteral(red: 0.937, green: 0.400, blue: 0.227, alpha: 1),
    boldColor     = #colorLiteral(red: 0.906, green: 0.902, blue: 0.894, alpha: 1)
    
    static func applyThemeForTableViewCell(with view: UIView) {
        if ThemeManager.currentTheme() == .darkMode {
            view.backgroundColor = Constant.darkColor
        } else {
            view.backgroundColor = Constant.boldColor
        }
    }
    
    static func applyThemeForCollectionViewCell(with view: UIView) {
        if ThemeManager.currentTheme() == .darkMode {
            view.backgroundColor = Constant.darkColor
        } else {
            view.backgroundColor = Constant.boldColor
        }
    }
    
}
