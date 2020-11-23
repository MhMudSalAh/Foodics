//
//  CategoryContract.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

protocol CategoryView: class {
    var presenter: CategoryPresenterInterface! { get set }
    var meta: Meta? { get set }
    var categories: [Category] { get set }
    
    func showLoading()
    func hideLoading()
    
    func presentNetworkErrorScreen()
    func hideNetworkErrorScreen()
    
    func presentEmptyScreen()
    func hideEmptyScreen()
    
    func loadLocalCategories(_ page: Int?)
}

protocol CategoryPresenterInterface: class {
    var view: CategoryView? { get set }
    var router: CategoryRouterInterface! { get set }
    var interactor: CategoryInteractorInterface! { get set }
    
    func getCategories(_ page: Int)
    func didSelectCategory(_ category: Category)
    func presentSort(_ product: Product)
    func didClickSettings()
}

protocol CategoryInteractorInterface: class {
    var output: CategoryInteractorOutput? { get set }
    
    func getCategories(_ page: Int)
}

protocol CategoryInteractorOutput: class {
    
    func didGetCategories(_ categories: [Category], _ meta: Meta)
    func didFailedGetCategories(_ error: APIError)         
}

protocol CategoryRouterInterface: class {
    var viewController: UIViewController? { get set }
    
    func presentProductsCategory(_ category: Category)
    func presentSort(_ product: Product)
    func presentSettings()
    
    static func assembleModule() -> UIViewController
}
