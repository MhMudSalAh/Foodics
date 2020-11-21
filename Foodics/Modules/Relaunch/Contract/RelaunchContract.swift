//
//  RelaunchContract.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

protocol RelaunchView: class {
    var presenter: RelaunchPresenterInterface! { get set }
}
    
protocol RelaunchPresenterInterface: class {
    var view: RelaunchView? { get set }
    var router: RelaunchRouterInterface! { get set }
    var interactor: RelaunchInteractorInterface! { get set }
    
    func viewDidLoad()
}
    
protocol RelaunchInteractorInterface: class {
    var output: RelaunchInteractorOutput? { get set }
}
    
protocol RelaunchInteractorOutput: class {
        
}
    
protocol RelaunchRouterInterface: class {
    var viewController: UIViewController? { get set }
    
    func presentHome()

    static func assembleModule() -> UIViewController
}
