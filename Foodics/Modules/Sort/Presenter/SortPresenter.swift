//
//  SortPresenter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/21/20.
//

import UIKit

class SortPresenter: SortPresenterInterface {
    
    weak var view: SortView?
    var router: SortRouterInterface!
    var interactor: SortInteractorInterface!
}
    
extension SortPresenter: SortInteractorOutput {
        
}
