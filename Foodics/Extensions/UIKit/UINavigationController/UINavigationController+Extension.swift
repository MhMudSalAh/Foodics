//
//  UINavigationController+Extension.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

extension UINavigationController {
    
    func setup(setImageAsTitle: Bool? = false) {
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .redLogo
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        let font = UIFont.systemFont(ofSize: 18)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font]
        navigationBar.isTranslucent = false
    }
}
