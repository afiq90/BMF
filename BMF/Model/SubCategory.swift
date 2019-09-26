//
//  SubCategory.swift
//  BMF
//
//  Created by Afiq Hamdan on 11/09/2019.
//  Copyright © 2019 Afiq. All rights reserved.
//

import Foundation

struct SubCategories: Codable {
    let SubCategories: [SubCategory]
}

struct SubCategory: Codable {
    
    let SubCategoryName: String
    let SubCategoryImage: String?
    let brands: [String]?
    
}

//struct Brand: Codable {
//    let name : String
//    let image : String
    
    //    init(name: String = "MTT", image: String) {
    //        self.name = brandName
    //        self.image = brandImage
    //    }
//}
