//
//  ThemeManager.swift
//  BMF
//
//  Created by Afiq Hamdan on 21/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import Foundation
import UIKit

let selectedThemeKey = "selectedTheme"

class ThemeManager {
    
    static let
    darkColor     = #colorLiteral(red: 0.180, green: 0.235, blue: 0.266, alpha: 1),
    darkerColor   = #colorLiteral(red: 0.161, green: 0.208, blue: 0.235, alpha: 1),
    lightColor    = #colorLiteral(red: 0.964, green: 0.721, blue: 0.329, alpha: 1),
    linkColor     = #colorLiteral(red: 0.321, green: 0.901, blue: 0.882, alpha: 1),
    selectedColor = #colorLiteral(red: 0.937, green: 0.400, blue: 0.227, alpha: 1),
    textColor     = #colorLiteral(red: 0.623, green: 0.647, blue: 0.663, alpha: 1),
    boldColor     = #colorLiteral(red: 0.906, green: 0.902, blue: 0.894, alpha: 1)
    
    static func currentTheme() -> Theme {
        if let storedTheme = (UserDefaults.standard.value(forKey: selectedThemeKey) as AnyObject).integerValue {
            return Theme(rawValue: storedTheme)!
        } else {
            return .darkMode
        }
    }
    
    static func applyTheme(theme: Theme) {
        // First persist the selected theme using NSUserDefaults.
        UserDefaults.standard.set(theme.rawValue, forKey: selectedThemeKey)
        UserDefaults.standard.synchronize()

        // You get your current (selected) theme and apply the main color to the tintColor property of your application’s window.
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.mainColor

        //Navigation appearance
        UINavigationBar.appearance().barStyle = theme.navBarStyle
        UINavigationBar.appearance().barTintColor = theme.navBarTintColor
        UINavigationBar.appearance().tintColor = theme.tintColor

        //TabBar appearance
        UITabBar.appearance().tintColor = theme.tabBarTintColor
        UITabBar.appearance().unselectedItemTintColor = theme.unselectedTabBarTintColor
        UITabBar.appearance().barStyle = theme.navBarStyle

        //Label appearance
        UILabel.appearance().textColor = theme.titleTextColor
//        UILabel.appearance(whenContainedInInstancesOf: [CategoryTableViewCell.self]).textColor = theme.titleTextColor
//        UILabel.appearance(whenContainedInInstancesOf: [NewsTableViewCell.self]).textColor = theme.titleTextColor
//        UILabel.appearance(whenContainedInInstancesOf: [AboutTableViewCell.self]).textColor = theme.titleTextColor

        //Button appearance
        UIButton.appearance(whenContainedInInstancesOf: [NewsTableViewCell.self]).backgroundColor = theme.buttonBackgroundColor
        UIButton.appearance(whenContainedInInstancesOf: [NewsTableViewCell.self]).setTitleColor(theme.buttonTextColor, for: .normal)

        UIButton.appearance(whenContainedInInstancesOf: [SubCategoryCollectionViewCell.self]).backgroundColor = theme.buttonBackgroundColor
        UIButton.appearance(whenContainedInInstancesOf: [SubCategoryCollectionViewCell.self]).setTitleColor(theme.buttonTextColor, for: .normal)
        UILabel.appearance(whenContainedInInstancesOf: [SubCategoryCollectionViewCell.self]).textColor = theme.collectionViewTextColor
//        UILabel.appearance(whenContainedInInstancesOf: [SubCategoryCollectionViewCell.self]).mainViewColor = theme.collectionViewTextColor
//        SubCategoryCollectionViewCell.appearance().mainViewColor = UIColor.purple
        
        //TableView appearance
        UITableView.appearance().backgroundColor = theme.backgroundColor
        UITableViewCell.appearance().backgroundColor = theme.backgroundColor
//        BrandTableViewCell().cellContentView?.appearance().backgroundColor = UIColor.purple
//        SubCategoryCollectionViewCell.appearance().mainViewColor = UIColor.purple
        
        //CollectionView appearance
        UICollectionView.appearance().backgroundColor = theme.backgroundColor
        UICollectionViewCell.appearance().backgroundColor = theme.backgroundColor
    
        //Activity Indicator appearance
//        UIActivityIndicatorView.appearance(whenContainedInInstancesOf: [ResourceStatusOverlay.self]).style = .whiteLarge


    }
    
    static private func emptyView(withBackground color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
    
}
