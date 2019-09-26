//
//  CategoryAPI.swift
//  BMF
//
//  Created by Afiq Hamdan on 12/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import Foundation

struct CategoryAPI: Codable {
    let categories: [Category]
    let categoryName: String
    let categoryDescription: String
    let categoryImage: String
    let subCategoryLink: String
}
