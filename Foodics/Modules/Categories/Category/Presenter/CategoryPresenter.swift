//
//  CategoryPresenter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class CategoryPresenter: CategoryPresenterInterface {
    
    weak var view: CategoryView?
    var router: CategoryRouterInterface!
    var interactor: CategoryInteractorInterface!
        
    func getCategories(_ page: Int) {
        view?.showLoading()
        interactor.getCategories(page)
    }
    
    func didSelectCategory(_ category: Category) {
        router.presentProductsCategory(category)
    }
    
    func presentSort(_ product: Product) {
        router.presentSort(product)
    }
    
    func didClickSettings() {
        router.presentSettings()
    }

}

extension CategoryPresenter: CategoryInteractorOutput {
    
    func didGetCategories(_ categories: [Category], _ meta: Meta) {
        DispatchQueue.main.async {
            self.view?.hideNetworkErrorScreen()
            self.view?.meta = meta
            _ = MetasManager().store(meta)
            let categoriesLimit = categories.takeElements(elementCount: 20)
            for categoryLimit in categoriesLimit {
                categoryLimit.current = meta.currentPage
                categoryLimit.last = meta.lastPage
                _ = CategoriesManager().store(categoryLimit)
            }
            if meta.currentPage! < meta.lastPage! {
                self.getCategories(meta.currentPage! + 1)
            } else {
                self.view?.loadLocalCategories(nil)
            }
        }
    }
    
    func didFailedGetCategories(_ error: APIError) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
            self.checkError(error)
            self.view?.presentEmptyScreen()
        }
    }
    
    func checkError(_ error: APIError) {
        switch error.type {
        case .network:
            self.view?.presentNetworkErrorScreen()
            break
        default:
            if error.message != nil {
                
            }
            break
        }
    }
    
}
