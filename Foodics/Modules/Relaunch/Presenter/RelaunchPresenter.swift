//
//  RelaunchPresenter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

class RelaunchPresenter: RelaunchPresenterInterface {
    
    weak var view: RelaunchView?
    var router: RelaunchRouterInterface!
    var interactor: RelaunchInteractorInterface!
    
    func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.router.presentHome()
        }
    }
}
    
extension RelaunchPresenter: RelaunchInteractorOutput {
        
}
