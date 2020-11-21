//
//  CategoriesService.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import Foundation

extension Api {
    
    enum Categories: ServiceProtocol {
        
        case get(_ page: Int)
        
        var path: String {
            switch self {
            case .get:
                return API.SERVICE_CATEGORIES
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .get:
                return .GET
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case let .get(page):
                return ["page" : page]
            }
        }
        
        var headers: Headers? {
            switch self {
            case .get:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case .get:
                return nil
            }
        }
    }
}
