//
//  APIResponse.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

enum APIResponse<T> {
    
    case success(T, Meta?)
    case failure(APIError)
    case complete
    case page(Meta)
}
