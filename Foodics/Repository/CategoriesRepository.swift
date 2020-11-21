//
//  CategoriesRepository.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

let CATEGORY = CategoriesRepository.shared

class CategoriesRepository: Repo {
    
    static let shared = CategoriesRepository()
    
    func get(_ page: Int, _ completion: @escaping (Response<[Category]>) -> ()) {
        provider.request(type: [Category].self, service: Api.Categories.get(page)) { response in
            switch response {
            case let .success(categories, meta):
                completion(.onSuccess(categories, meta))
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
