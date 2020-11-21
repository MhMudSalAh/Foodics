//
//  SplashContract.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

protocol SplashView: class {
    var presenter: SplashPresenterInterface! { get set }
}

protocol SplashPresenterInterface: class {
    var view: SplashView? { get set }
    var interactor: SplashInteractorInteface! { get set }
    var router: SplashRouterInterface! { get set }
    
    func viewDidLoad()
}

protocol SplashInteractorInteface: class {
    var output: SplashInteractorOutput! { get set }
    
}

protocol SplashInteractorOutput: class {

}

protocol SplashRouterInterface: class {
    
    var viewController: UIViewController? { get set }
    
    func presentCategories()
    
    static func assembleModule() -> UIViewController
}
