//
//  SortRouter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/21/20.
//

import UIKit

class SortRouter: SortRouterInterface {
    
    weak var viewController: UIViewController?

    static func assembleModule(_ product: Product) -> SortController {
        let view: SortController = UIStoryboard(name: "Sort", bundle: nil).instantiateViewController(withIdentifier: "SortController") as! SortController
            
        let presenter = SortPresenter()
        let interactor = SortInteractor()
        let router = SortRouter()
        
        view.product = product
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        view.modalPresentationStyle = .custom
        view.modalTransitionStyle = .crossDissolve

        return view
    }
}
