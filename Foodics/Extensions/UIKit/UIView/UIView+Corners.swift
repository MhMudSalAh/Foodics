//
//  UIView+Corners.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func conrnerRadiusRL(_ view: UIView){
        if LOCAL.getLanguage() == Language.EN.rawValue {
            view.roundCorners([.bottomLeft, .topLeft], radius: 10)
        } else if LOCAL.getLanguage() == Language.AR.rawValue {
            view.roundCorners([.bottomRight, .topRight], radius: 10)
        }
    }
    
    func conrnerRadiusDisCount(_ view: UIView,_ label: UILabel){
        if LOCAL.getLanguage() == Language.EN.rawValue {
            view.roundCorners([.topLeft, .bottomRight], radius: 10)
            label.roundCorners([.topLeft, .bottomRight], radius: 10)
        } else if LOCAL.getLanguage() == Language.AR.rawValue {
            view.roundCorners([.topRight, .bottomLeft], radius: 10)
            label.roundCorners([.topRight, .bottomLeft], radius: 10)
        }
    }
    
    func cornerRadiusTop(_ view: UIView){
        view.roundCorners([.topRight, .topLeft], radius: 10)
    }
}
