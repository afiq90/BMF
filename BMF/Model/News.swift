//
//  News.swift
//  BMF
//
//  Created by Afiq Hamdan on 15/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import Foundation

struct LatestNews: Codable {
    let news: [News]
}

struct News: Codable {
    
    let title: String
    let description: String
    let image: String?
    let originalLink: String
    let date: String
    
}
