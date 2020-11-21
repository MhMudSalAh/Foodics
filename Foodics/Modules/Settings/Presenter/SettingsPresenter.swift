//
//  SettingsPresenter.swift
//  Benaak
//
//  Created by Mohamed Elbana on 1/8/20.
//  Copyright © 2020 Tarseya. All rights reserved.
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
