//
//  Product.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

class Product: NSObject, Codable {
    
    var id: String?
    var titleEn: String? = ""
    var titleAr: String? = ""
    var price: Double? = 0.0
    var image: String?
    
    override init() {
        super.init()
    }
    
    func imageURL(thumbnail: Bool? = false) -> String? {
        if let image = image { return API.getImagePath(image, thumbnail!) }
        return nil
    }
 }

extension Product {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case titleEn = "name"
        case titleAr = "name_localized"
        case price
        case image
    }
}
