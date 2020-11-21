//
//  SubCategoriesPresenter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class SubCategoriesPresenter: SubCategoriesPresenterInterface {

    weak var view: SubCategoriesView?
    var router: SubCategoriesRouterInterface!
    var interactor: SubCategoriesInteractorInterface!
            
    func getProducts(_ categoryId: String, _ page: Int) {
        view?.showLoading()
        interactor.getProducts(categoryId, page)
    }
    
    func didSelectProduct() {
        router.popView()
    }
    
    func presentSort(_ product: Product) {
        router.presentSort(product)
    }
}
    
extension SubCategoriesPresenter: SubCategoriesInteractorOutput {
    
    
    func didGetProducts(_ products: [Product], _ meta: Meta) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
            self.view?.hideNetworkErrorScreen()
            self.view?.products = products.takeElements(elementCount: 20)
            self.view?.meta = meta
        }
    }
    
    func didFailedGetProducts(_ error: APIError) {
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
                //Banner.showError(message)
            }
            break
        }
    }
}
