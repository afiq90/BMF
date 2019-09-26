//
//  Category.swift
//  BMF
//
//  Created by Afiq Hamdan on 10/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [Category]
}

struct Category: Codable {
    
    let categoryName: String
    let categoryImage: String
    let categoryDescription: String
    let subCategoryLink: String
//    let subCategory: [SubCategory]?
//    let brands: [Brand]?
    
}
