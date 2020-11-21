//
//  SettingsRouter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class SettingsRouter: SettingsRouterInterface {

    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view: SettingsController = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "SettingsController") as! SettingsController
        
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor()
        let router = SettingsRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
