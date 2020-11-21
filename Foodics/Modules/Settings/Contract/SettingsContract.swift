//
//  SettingsContract.swift
//  Benaak
//
//  Created by Mohamed Elbana on 1/8/20.
//  Copyright © 2020 Tarseya. All rights reserved.
//

import UIKit

protocol SettingsView: class {
    var presenter: SettingsPresenterInterface! { get set }
    
    func showLanguageAlert()
}

protocol SettingsPresenterInterface: class {
    var view: SettingsView? { get set }
    var router: SettingsRouterInterface! { get set }
    var interactor: SettingsInteractorInterface! { get set }
    
    func changeLanguageClicked()
    func changeLanguage()
}

protocol SettingsInteractorInterface: class {
    var output: SettingsIntercatorOutput? { get set }
}

protocol SettingsIntercatorOutput: class {
    
}

protocol SettingsRouterInterface {
    var viewController: UIViewController? { get set }
         
    static func assembleModule() -> UIViewController
}
