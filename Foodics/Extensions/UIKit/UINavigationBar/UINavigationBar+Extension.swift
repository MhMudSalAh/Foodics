//
//  UINavigationBar+Extension.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

extension UINavigationBar {
    
    @IBInspectable var background: UIImage? {
        get {
            return backgroundImage(for: .default)
        }
        set {
            if newValue == nil {
                setBackgroundImage(UIImage(), for: .default)
            } else {
                setBackgroundImage(newValue, for: .default)
            }
            shadowImage = UIImage()
        }
    }
}
