//
//  ProductRepository.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/19/20.
//

import Foundation

let PRODUCT = ProductsRepository.shared

class ProductsRepository: Repo {
    
    static let shared = ProductsRepository()
    
    func get(_ categoryId: String, _ page: Int , _ completion: @escaping (Response<[Product]>) -> ()) {
        provider.request(type: [Product].self, service: Api.Products.get(categoryId, page)) { response in
            switch response {
            case let .success(products, meta):
                completion(.onSuccess(products, meta))
                break
            case let .failure(error):
                completion(.onFailure(error))
                break
            case .complete:
                completion(.onCompleted)
                break
            case let .page(meta):
                completion(.onPage(meta))
                break
            }
        }
    }
}

