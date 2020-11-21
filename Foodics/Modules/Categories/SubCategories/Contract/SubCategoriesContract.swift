//
//  SubCategoriesContract.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

protocol SubCategoriesView: class {
    var presenter: SubCategoriesPresenterInterface! { get set }
    var products: [Product] { get set }
    var meta: Meta { get set }
    
    func showLoading()
    func hideLoading()
        
    func presentEmptyScreen()
    func hideEmptyScreen()
    
    func presentNetworkErrorScreen()
    func hideNetworkErrorScreen()
}
    
protocol SubCategoriesPresenterInterface: class {
    var view: SubCategoriesView? { get set }
    var router: SubCategoriesRouterInterface! { get set }
    var interactor: SubCategoriesInteractorInterface! { get set }

    func getProducts(_ categoryId: String, _ page: Int)
    func didSelectProduct()
    func presentSort(_ product: Product)
}

protocol SubCategoriesInteractorInterface: class {
    var output: SubCategoriesInteractorOutput? { get set }
    
    func getProducts(_ categoryId: String, _ page: Int)
}
    
protocol SubCategoriesInteractorOutput: class {
    
    func didGetProducts(_ products: [Product], _ meta: Meta)
    func didFailedGetProducts(_ error: APIError)
}
    
protocol SubCategoriesRouterInterface: class {
    var viewController: UIViewController? { get set }
    
    func popView()
    func presentSort(_ product: Product)
    static func assembleModule(_ category: Category) -> UIViewController
}
