//
//  Meta.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/18/20.
//

import Foundation

struct Meta: Codable {
    
    var currentPage: Int?
    var from: Int?
    var lastPage: Int?
    var path: String?
    var perPage: Int?
    var to: Int?
    var total: Int?
}

extension Meta {
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case path
        case perPage = "per_page"
        case to
        case total
    }
}
