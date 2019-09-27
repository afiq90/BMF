//
//  NewsViewController.swift
//  BMF
//
//  Created by Afiq Hamdan on 15/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    lazy var loadingIndicatorView: UIActivityIndicatorView = {
        let loadingIndicatorView = UIActivityIndicatorView(style: .gray)
        loadingIndicatorView.center = self.view.center
        loadingIndicatorView.color = UIColor.red
        loadingIndicatorView.startAnimating()
        
        return loadingIndicatorView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        //        refreshControl.backgroundColor = UIColor.yellow
        refreshControl.center = self.view.center
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.beginRefreshing()
        //        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Kategori Data ...")
        refreshControl.addTarget(self, action: #selector(fetchNewsFromAPI), for: UIControl.Event.valueChanged)
        
        return refreshControl
    }()
    
    var newsArray = [News]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Berita Terkini"
        
        newsTableView.refreshControl = refreshControl
        //        categoryTableView.alwaysBounceVertical = true

        setupTableView()
        addLoadingIndicator()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        fetchNewsFromAPI()

    }
    
    func addLoadingIndicator() {
        self.view.addSubview(loadingIndicatorView)
    }
    
    func setupTableView() {
        // register category custom cell to categoryTableView
        let newsCustomCell = UINib(nibName: "NewsTableViewCell", bundle: nil)
        newsTableView.register(newsCustomCell, forCellReuseIdentifier: "newsCell")
    }
    
    @objc func fetchNewsFromAPI() {
        APIManager.shared.getNews { (news, errorMessage) in
            if let errorMessage = errorMessage {
                print("what is my error = \(errorMessage)")
                DispatchQueue.main.async {
                    self.showAlert(message: errorMessage)
                    self.loadingIndicatorView.isHidden = true
                }
            }
            
            print("news array = \(news)")
            guard let news = news else {return}
            self.newsArray = news
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.loadingIndicatorView.stopAnimating()
                self.newsTableView.reloadData()
            }
        }
    }

}


extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 161
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        //Set the theme for cell.mainView and cell.descriptionLabel
//        let currentTheme = ThemeManager.currentTheme()
//        cell.newsView.backgroundColor = currentTheme.backgroundColor
//        cell.newsTitleLabel.textColor = currentTheme.titleTextColor
//        cell.newsDate.textColor = currentTheme.titleTextColor

        let news = newsArray[indexPath.row]
        cell.newsTitleLabel.text = news.title
        cell.newsDate.text = news.date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let newsVC = sb.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        let news = newsArray[indexPath.row]
        newsVC.newsURL = news.originalLink
        
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
}
