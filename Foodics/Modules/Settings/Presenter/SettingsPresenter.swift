//
//  SettingsPresenter.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class SettingsPresenter: SettingsPresenterInterface {

    var view: SettingsView?
    var router: SettingsRouterInterface!
    var interactor: SettingsInteractorInterface!
    
    func changeLanguageClicked() {
        view?.showLanguageAlert()
    }
    
    func changeLanguage() {
        LOCAL.changeLocale()
    }
    
    func changeNotificationState(_ isOn: Bool) {
        // MARK: TODO: Add Action
    }
}

extension SettingsPresenter: SettingsIntercatorOutput {
    
}
