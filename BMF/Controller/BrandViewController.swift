//
//  BrandViewController.swift
//  BMF
//
//  Created by Afiq Hamdan on 13/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

class BrandViewController: UIViewController {
    
    @IBOutlet weak var brandTableView: UITableView!
    
    var searchController: UISearchController!

    var muslimBrands: [String] = []
    var filteredmuslimBrands = [String]()
    var subCategoryName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "\(subCategoryName)"

        filteredmuslimBrands = muslimBrands
        setupTableView()

        // Add the search bar icon to the right of navigationItem, tap on it to show searchBar
        searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(barButtonItemClicked)), animated: true)

    }
    
    func setupNavbar() {
        self.definesPresentationContext = true

        //        self.navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Cari Jenama"
        searchController.hidesNavigationBarDuringPresentation = true
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = true
        
        self.present(searchController, animated: true, completion: nil)
        
    }
    
    @objc func barButtonItemClicked() {
        print("right bar tapped")
        setupNavbar()
        
    }

    func setupTableView() {
        // register category custom cell to categoryTableView
        let brandCustomCell = UINib(nibName: "BrandTableViewCell", bundle: nil)
        brandTableView.register(brandCustomCell, forCellReuseIdentifier: "brandCell")
    }

}

extension BrandViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if !searchController.isActive {
            return 0
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("The brand count tableView: \(filteredmuslimBrands.count)")
        
        return filteredmuslimBrands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath) as! BrandTableViewCell
        
        //Set the theme for cell.mainView and cell.descriptionLabel
        let currentTheme = ThemeManager.currentTheme()
        cell.cellContentView.backgroundColor = currentTheme.backgroundColor
        cell.categoryName.textColor = currentTheme.titleTextColor
        
        cell.categoryName.text = filteredmuslimBrands[indexPath.row]
//        cell.categoryImageview.downloaded(from: muslimBrands.categoryImage)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected index: \(indexPath.row)")
      
    }
    
}

/* search controller searchbar delegate */
extension BrandViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
             return
        }
        
        //handle the return value depend on searchbar text
        if !searchText.isEmpty {
            print("search text = \(searchText)")
            filteredmuslimBrands = muslimBrands.filter { (x) -> Bool in
                return x.lowercased().contains(searchText.lowercased())
            }
        } else {
            print("search text empty")
            filteredmuslimBrands = muslimBrands
        }
        
        brandTableView.reloadData()
    }
}
