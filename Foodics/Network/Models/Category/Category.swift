//
//  Category.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import Foundation

class Category: NSObject, Codable {
    
    var id: String?
    var titleAr: String?
    var titleEn: String?
    var current: Int?
    var last: Int?
    
    override init() {
        super.init()
    }
}

extension Category {
    
    enum CodingKeys: String, CodingKey {
        case id
        case titleAr = "name_localized"
        case titleEn = "name"
        case current
        case last
    }
}
