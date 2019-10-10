//
//  BrandViewController.swift
//  BMF
//
//  Created by Afiq Hamdan on 10/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

class SubCategoryViewController: UIViewController {
    
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    
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
    
    var searchController: UISearchController!
    
    var subCategoryLink: String!
    var subCategoryArray: [SubCategory] = []
    var filteredSubCategoryArray = [SubCategory]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sub Kategori"
        
        setupCollectionView()
        addLoadingIndicator()
        
        // Add the search bar icon to the right of navigationItem, tap on it to show searchBar
        searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(barButtonItemClicked)), animated: true)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        fetchSubCategoryFromAPI()
    }
    
    func setupNavbar() {
        
        //Fix the overlap searchbar when push to brandViewController
        self.definesPresentationContext = true

        //        self.navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Cari Kategori"
        searchController.hidesNavigationBarDuringPresentation = true
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = true
        self.present(searchController, animated: true, completion: nil)
    

    }
    
    @objc func barButtonItemClicked() {
        print("right bar tapped")
        setupNavbar()
        
    }
    
    func addLoadingIndicator() {
        self.view.addSubview(loadingIndicatorView)
    }

    
    func setupCollectionView() {
        let subCategoryCustomCell = UINib(nibName: "SubCategoryCollectionViewCell", bundle: nil)
        subCategoryCollectionView.register(subCategoryCustomCell, forCellWithReuseIdentifier: "subCategoryCell")
        subCategoryCollectionView.showsHorizontalScrollIndicator = false
        
        //        self.view.backgroundColor = .black // color for BrandViewController itself, uncomment for debugging
        let bView = UIView()
        bView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2) // .lightGray //UIColor(red: 191, green: 191, blue: 191, alpha: 1) //this color is for brandCollectionView, uncomment for debugging
        subCategoryCollectionView.backgroundView = bView // add custom color to subCategoryCollectionView backgroundView
        
        let layout = UICollectionViewFlowLayout()
        //        layout.itemSize = CGSize(width: 200, height: 200)
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        //        layout.estimatedItemSize = CGSize(width: 200, height: 200)
        subCategoryCollectionView.collectionViewLayout = layout
    }
    
    func fetchSubCategoryFromAPI() {
        APIManager.shared.getSubCategory(subCategoryName: subCategoryLink) { [weak self] (subCategories, errorMessage) in
            
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
            
            guard let subCategories = subCategories else {return}
            self?.subCategoryArray = subCategories
            self?.filteredSubCategoryArray = self?.subCategoryArray ?? []
            DispatchQueue.main.async {
                self?.loadingIndicatorView.stopAnimating()
                self?.subCategoryCollectionView.reloadData()
                self?.retryButton.isHidden = true
                self?.retryButton.removeFromSuperview()

            }
            
            
        }
    }
    
    @objc func reloadData() {
        self.loadingIndicatorView.startAnimating()
        fetchSubCategoryFromAPI()
    }
    
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
    //            navigationController?.setNavigationBarHidden(true, animated: true)
    //        } else {
    //            navigationController?.setNavigationBarHidden(false, animated: true)
    //        }
    //    }
}


extension SubCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if !searchController.isActive {
            return CGSize(width: 0, height: 0)
        } else {
            return CGSize(width: 40, height: 40)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredSubCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = subCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "subCategoryCell", for: indexPath) as! SubCategoryCollectionViewCell
        
        //Set the theme for cell.mainView and cell.descriptionLabel
//        let currentTheme = ThemeManager.currentTheme()
//        cell.mainView.backgroundColor = currentTheme.backgroundColor
//        cell.descriptionLabel.textColor = currentTheme.titleTextColor
        
        let subcategory = filteredSubCategoryArray[indexPath.item]
        cell.descriptionLabel.text = subcategory.SubCategoryName
        if let imageLink = subcategory.SubCategoryImage {
//            cell.brandImageView.downloaded(from: imageLink)
            cell.brandImageView.setImage(with: imageLink)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (view.frame.width / 2) - 5, height: 265)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("sub category index = \(indexPath.item)")
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let brandVC = sb.instantiateViewController(withIdentifier: "BrandViewController") as! BrandViewController
        if let muslimbrands = self.filteredSubCategoryArray[indexPath.row].brands {
            brandVC.muslimBrands = muslimbrands
        }
        brandVC.subCategoryName = self.filteredSubCategoryArray[indexPath.row].SubCategoryName
        self.navigationController?.pushViewController(brandVC, animated: true)
        
    }
    
}

/* search controller searchbar delegate */
extension SubCategoryViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        //handle the return value depend on searchbar text
        if !searchText.isEmpty {
            print("search text = \(searchText)")
            filteredSubCategoryArray = subCategoryArray.filter { (subCategory) -> Bool in
                return subCategory.SubCategoryName.lowercased().contains(searchText.lowercased())
            }
        } else {
            print("search text empty")
            filteredSubCategoryArray = subCategoryArray
        }
        
        subCategoryCollectionView.reloadData()
    }
    
}
