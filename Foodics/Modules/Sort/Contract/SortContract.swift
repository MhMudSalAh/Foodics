//
//  SortContract.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/21/20.
//

import UIKit

protocol SortView: class {
    var presenter: SortPresenterInterface! { get set }
    var product: Product { get set }
}
    
protocol SortPresenterInterface: class {
    var view: SortView? { get set }
    var router: SortRouterInterface! { get set }
    var interactor: SortInteractorInterface! { get set }
}
    
protocol SortInteractorInterface: class {
    var output: SortInteractorOutput? { get set }
}
    
protocol SortInteractorOutput: class {
        
}
    
protocol SortRouterInterface: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ prodcut: Product) -> SortController
}
