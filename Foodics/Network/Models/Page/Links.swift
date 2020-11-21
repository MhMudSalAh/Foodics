//
//  Links.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/18/20.
//

import Foundation

struct Links: Codable {
    
    var first: String?
    var last: String?
    var prev: String?
    var next: String?
}

extension Links {
    
    enum CodingKeys: String, CodingKey {
        case first
        case last
        case prev
        case next
    }
}

