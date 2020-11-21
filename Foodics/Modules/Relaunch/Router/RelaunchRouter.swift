//
//  RelaunchRouter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

class RelaunchRouter: RelaunchRouterInterface {
    
    weak var viewController: UIViewController?
    
    func presentHome() {
//        TAB.selectedIndex = 0
//        let appDlg = UIApplication.shared.delegate as? AppDelegate
//        appDlg?.window?.rootViewController = TAB
    }

    static func assembleModule() -> UIViewController {
        let view: RelaunchController = UIStoryboard(name: "Relaunch", bundle: nil).instantiateViewController(withIdentifier: "RelaunchController") as! RelaunchController
            
        let presenter = RelaunchPresenter()
        let interactor = RelaunchInteractor()
        let router = RelaunchRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
