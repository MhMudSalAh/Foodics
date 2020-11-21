//
//  CategoryRouter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class CategoryRouter: CategoryRouterInterface {
    
    weak var viewController: UIViewController?
    
    func presentProductsCategory(_ category: Category) {
        let vc = SubCategoriesRouter.assembleModule(category)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentSort(_ product: Product) {
        let vc = SortRouter.assembleModule(product)
        vc.transitioningDelegate = viewController as? UIViewControllerTransitioningDelegate
        viewController?.present(vc, animated: true, completion: nil)
    }

    func presentSettings() {
        let vc = SettingsRouter.assembleModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func assembleModule() -> UIViewController {
        let view: CategoryController = UIStoryboard(name: "Category", bundle: nil).instantiateViewController(withIdentifier: "CategoryController") as! CategoryController
        
        let presenter = CategoryPresenter()
        let interactor = CategoryInteractor()
        let router = CategoryRouter()
        
        let navigation = NavController(rootViewController: view)
        navigation.setup()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return navigation
    }
}
