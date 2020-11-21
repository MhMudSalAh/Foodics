//
//  SplashPresenter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

class SplashPresenter: SplashPresenterInterface {

    weak var view: SplashView?
    var interactor: SplashInteractorInteface!
    var router: SplashRouterInterface!
    var willRedirectToHome: Bool!
    
    func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.router.presentCategories()
        }
    }
}

extension SplashPresenter: SplashInteractorOutput {

}
