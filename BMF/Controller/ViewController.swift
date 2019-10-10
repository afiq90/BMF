//
//  ViewController.swift
//  BMF
//
//  Created by Afiq Hamdan on 10/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit
import SwiftRater
import Crashlytics
import GoogleMobileAds

class ViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    lazy var loadingIndicatorView: UIActivityIndicatorView = {
        let loadingIndicatorView = UIActivityIndicatorView(style: .gray)
        loadingIndicatorView.center = self.view.center
        loadingIndicatorView.color = UIColor.red
        loadingIndicatorView.startAnimating()

        return loadingIndicatorView
    }()
    
    lazy var retryButton: UIButton = {
        // add new button to retry loading the data
        let retryButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        retryButton.backgroundColor = UIColor.blue
        retryButton.center = self.view.center
        retryButton.layer.cornerRadius = 20
        retryButton.setTitle("Cuba Lagi", for: .normal)
        retryButton.setTitleColor(.white, for: .focused)
        retryButton.addTarget(self, action: #selector(self.reloadData), for: .touchUpInside)
        
        return retryButton
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
//        refreshControl.backgroundColor = UIColor.yellow
        refreshControl.center = self.view.center
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.beginRefreshing()
//        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Kategori Data ...")
        refreshControl.addTarget(self, action: #selector(fetchCategoryFromAPI), for: UIControl.Event.valueChanged)
        
        return refreshControl
    }()
    
    lazy var headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 65))
        headerView.backgroundColor = Constant.yellowColor
        
        let headerViewLabel = UILabel()
        headerViewLabel.translatesAutoresizingMaskIntoConstraints = false
        headerViewLabel.text = "Nota: Jika terdapat sebarang kekhilafan dalam maklumat di dalam aplikasi ini, sila email kepada admin@blablabla.com. Terima kasih.! 👌🏻"
        headerViewLabel.textColor = UIColor.black
        headerViewLabel.textAlignment = .center
        headerViewLabel.numberOfLines = 0
        
        let horizontalConstraint = NSLayoutConstraint(item: headerViewLabel, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: headerView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: headerViewLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: headerView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: headerViewLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: headerView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: headerViewLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: headerView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)


//        let widthConstraint = NSLayoutConstraint(item: headerViewLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
//        let heightConstraint = NSLayoutConstraint(item: headerViewLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        headerView.addSubview(headerViewLabel)
        headerView.addConstraints([horizontalConstraint, verticalConstraint, leadingConstraint, trailingConstraint])
        
        return headerView
    }()
    
    lazy var bannerAdView: GADBannerView = {
        let banner = GADBannerView(adSize: kGADAdSizeLargeBanner)
        banner.adUnitID = Constant.testBannerUnitID
        banner.rootViewController = self
        banner.load(GADRequest())
        return banner
    }()
    
    lazy var interstitial: GADInterstitial = {
        let interstitial = GADInterstitial(adUnitID: Constant.testInterstitialUnitID)
        interstitial.load(GADRequest())
        return interstitial
    }()
  
    var categoryArray: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        categoryTableView.refreshControl = refreshControl
//        categoryTableView.alwaysBounceVertical = true
        
        setupNavbar()
        setupTableView()
        addLoadingIndicator()
    
        print("The categories count: \(categoryArray.count)")

        //Force crash
//        Crashlytics.sharedInstance().crash()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //Apply current theme
//        ThemeManager.currentTheme()
        
        //Show SwiftRater based on condition set on AppDelegate
        SwiftRater.check()
        
        fetchCategoryFromAPI()

    }
    
    func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        // register category custom cell to categoryTableView
        let categoryCustomCell = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        categoryTableView.register(categoryCustomCell, forCellReuseIdentifier: "categoryCell")
        categoryTableView.tableHeaderView = headerView
        categoryTableView.tableFooterView = bannerAdView
    }
    
    
    func addLoadingIndicator() {
        self.view.addSubview(loadingIndicatorView)
    }
    
    @objc func fetchCategoryFromAPI() {
        
        APIManager.shared.getCategory{ [weak self] (categories, errorMessage) in
            //handler if there is error, eg: no internet connection
            if let errorMessage = errorMessage {
                print("what is my error = \(errorMessage)")
                DispatchQueue.main.async {
                    self?.showAlert(message: errorMessage)
                    self?.loadingIndicatorView.isHidden = true
                    self?.view.addSubview(self!.retryButton)
                    self?.retryButton.isHidden = false
                }
            }
            
            
            // set the categoryArray value
            // print("The categories is: \(self.categoryArray)")
            guard let categories = categories else {return}
            self?.categoryArray = categories
            DispatchQueue.main.async {
                self?.loadingIndicatorView.stopAnimating()
                self?.retryButton.isHidden = true
                self?.retryButton.removeFromSuperview()
                self?.refreshControl.endRefreshing()
                self?.categoryTableView.reloadData()
            }
            
        }
    }
    
    @objc func reloadData() {
        self.loadingIndicatorView.startAnimating()
        fetchCategoryFromAPI()
    }
    
}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("The categories count tableView: \(categoryArray.count)")

        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        let category = categoryArray[indexPath.row]
        cell.categoryName.text = category.categoryName
        cell.categoryDescription.text = category.categoryDescription
//        cell.categoryImageview.downloaded(from: category.categoryImage)
        cell.categoryImageview.setImage(with: category.categoryImage)
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected index: \(indexPath.row)")
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let subCategoryVC = sb.instantiateViewController(withIdentifier: "SubCategoryViewController") as! SubCategoryViewController
        let selectedCategory = categoryArray[indexPath.row]
        print("subcategory link: \(selectedCategory.subCategoryLink)")
        subCategoryVC.subCategoryLink = selectedCategory.subCategoryLink
        subCategoryVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(subCategoryVC, animated: true)
    }
   
}
