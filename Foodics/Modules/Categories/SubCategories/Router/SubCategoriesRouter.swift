//
//  SubCategoriesRouter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class SubCategoriesRouter: SubCategoriesRouterInterface {
    
    weak var viewController: UIViewController?
    
    func popView() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func presentSort(_ product: Product) {
        let vc = SortRouter.assembleModule(product)
        vc.transitioningDelegate = viewController as? UIViewControllerTransitioningDelegate
        viewController?.present(vc, animated: true, completion: nil)
    }

    
    static func assembleModule(_ category: Category) -> UIViewController {
        let view: SubCategoriesController = UIStoryboard(name: "SubCategories", bundle: nil).instantiateViewController(withIdentifier: "SubCategoriesController") as! SubCategoriesController
        
        let presenter = SubCategoriesPresenter()
        let interactor = SubCategoriesInteractor()
        let router = SubCategoriesRouter()
        
        view.category = category
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
