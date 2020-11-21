//
//  ProductService.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/19/20.
//

import Foundation

extension Api {
    
    enum Products: ServiceProtocol {
        
        case get(_ categoryId: String, _ page: Int)
        
        var path: String {
            switch self {
            case .get:
                return API.SERVICE_PRODUCTS
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
            case let .get(categoryId, page):
                return ["category": categoryId, "page": page]
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
