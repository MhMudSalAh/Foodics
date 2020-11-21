//
//  HalfSizePresentationController.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class HalfSizePresentationController : UIPresentationController {
    
    var partialView: CGFloat {
        return UIScreen.main.bounds.height - 300
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            guard containerView != nil else {
                return CGRect(x: 50 , y: UIScreen.main.bounds.midY-UIScreen.main.bounds.height / 4, width: UIScreen.main.bounds.width - 100 , height: UIScreen.main.bounds.height / 2)
            }
            return CGRect(x: 50 , y: UIScreen.main.bounds.midY-UIScreen.main.bounds.height / 4, width: UIScreen.main.bounds.width - 100 , height: UIScreen.main.bounds.height / 2)
        }
    }
    
    override func presentationTransitionWillBegin() {
        
        let frameView = UIView(frame: containerView!.bounds)
        //frameView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        containerView?.addSubview(frameView)
        frameView.addSubview(presentedView!)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(HalfSizePresentationController.handleTap(_:)))
        frameView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let vc = presentedViewController as! SortController
        vc.dismiss(animated: true, completion: nil)
    }
}
