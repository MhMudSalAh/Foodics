//
//  CategoryInteractor.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class CategoryInteractor: CategoryInteractorInterface {
    
    weak var output: CategoryInteractorOutput?
    
    func getCategories(_ page: Int){
        CATEGORY.get(page) { (response) in
            switch response {
            case let .onSuccess(page, meta):
                self.output?.didGetCategories(page, meta!)
                break
            case let .onFailure(error):
                self.output?.didFailedGetCategories(error)
                break
            case .onCompleted:
                break
            case .onPage:
                break
            }
        }
    }
}
