//
//  APIManager.swift
//  BMF
//
//  Created by Afiq Hamdan on 12/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
    static let shared = APIManager()
    
    
    func getCategory(completionHandler: @escaping (_ result: [Category]?, _ error: String?) -> ()) {
        
        // Set up the URL request
        let categoryEndpoint: String = Constant.categoryURL
        guard let url = URL(string: categoryEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on category API")
                completionHandler(nil, error?.localizedDescription)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            print("responseData = \(responseData)")
            // parse the result as JSON, since that's what the API provides
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(Categories.self, from: responseData)
                // let's just print it to prove we can access it
                completionHandler(result.categories, nil)

            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        
        task.resume()
        
    }
    
    func getSubCategory(subCategoryName: String, completionHandler: @escaping (_ result: [SubCategory]?, _ error: String?) -> ()) {
        
        // Set up the URL request
        let subCategoryEndpoint: String = Constant.subcategoryURL + subCategoryName
        print("subCategory Endpoint = \(subCategoryEndpoint)")

        guard let url = URL(string: subCategoryEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)

        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on category API")
                completionHandler(nil, error?.localizedDescription)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            print("responseData = \(responseData)")
            // parse the result as JSON, since that's what the API provides
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(SubCategories.self, from: responseData)
                // let's just print it to prove we can access it
                completionHandler(result.SubCategories, nil)
            } catch  {
                print("\(error)")
                return
            }
        }
        
        task.resume()
        
    }
    
    func getNews(completionHandler: @escaping (_ result: [News]?, _ error: String?) -> ()) {
        
        // Set up the URL request
        let newsEndpoint: String = Constant.newsURL
        print("news Endpoint = \(newsEndpoint)")
        
        guard let url = URL(string: newsEndpoint) else {
            print("Error: cannot create URL")
            return
        }

        let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)

        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on category API")
                completionHandler(nil, error?.localizedDescription)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            print("responseData = \(responseData)")
            // parse the result as JSON, since that's what the API provides
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(LatestNews.self, from: responseData)
                // let's just print it to prove we can access it
                completionHandler(result.news, nil)
            } catch  {
                print("\(error)")
                return
            }
        }
        
        task.resume()
        
    }
    
}
