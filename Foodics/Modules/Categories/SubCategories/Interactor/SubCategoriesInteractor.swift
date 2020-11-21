//
//  SubCategoriesInteractor.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class SubCategoriesInteractor: SubCategoriesInteractorInterface {
    
    weak var output: SubCategoriesInteractorOutput?
    
    func getProducts(_ categoryId: String, _ page: Int) {
        PRODUCT.get(categoryId, page) { response in
            switch response {
            case let .onSuccess(products, meta):
                self.output?.didGetProducts(products, meta!)
                break
            case let .onFailure(error):
                self.output?.didFailedGetProducts(error)
                break
            case .onCompleted:
                break
            case .onPage:
                break
            }
        }
    }
}

