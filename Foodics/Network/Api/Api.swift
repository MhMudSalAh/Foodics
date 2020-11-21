//
//  Api.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import Foundation

let API = Api(.development)

enum APIConfigurations: String {
    
    case development = "debug"
    case stage = "stage"
    case release = "release"
}

final class Api {
    
    let config: APIConfigurations
    
    var BASE_URL: String {
        switch config {
        case .development:
            return "https://api.foodics.dev/"
        case .stage:
            return "https://api.foodics.dev/"
        case .release:
            return "https://api.foodics.dev/"
        }
    }
    
    init(_ config: APIConfigurations) {
        self.config = config
    }
    
    // MARK:- IMAGE PATH
    
    let IMAGE_PATH = "https://api.foodics.dev/images/"
    let IMAGE_PATH_THUMBNAIL = "https://api.foodics.dev/images/thumbnail/"
      
    // MARK:- CATEGORY
    
    let SERVICE_CATEGORIES = "v5/categories"
    
    // MARK:- PRODUCT
    
    let SERVICE_PRODUCTS = "v5/products"
}

extension Api {
    
    func getImagePath(_ path: String, _ thumbnail: Bool) -> String {
        return thumbnail ? "\(API.IMAGE_PATH_THUMBNAIL)\(path)" : "\(API.IMAGE_PATH)\(path)"
    }
}
