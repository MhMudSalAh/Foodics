//
//  SortView.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit
import SkeletonView

class SortController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var product: Product = Product()
    
    let fullView: CGFloat = 40
    var partialView: CGFloat {
        return UIScreen.main.bounds.height - 360
    }
    
    var presenter: SortPresenterInterface!
    var delegate: SortDelegate?
    
    var list: [String] = []
    
    var isMinimize: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addGesture()
    }
    
    func setupView() {
        img.loadImage(product.image)
        lblPrice.attributedText = lblPrice.getAttributedText("\(localizedText("price")): ", .black, "\(product.price ?? 0)" + localizedText("sar") + ".", .darkGray, 15, 12)
        
        if LOCAL.getLanguage() == Language.EN.rawValue {
            lblTitle.text = "\(product.titleEn ?? "")."
        } else {
            lblTitle.text = "\(product.titleAr ?? "")."
        }
    }
    
    func addGesture() {
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(SortController.panGesture))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }
    
    
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let velocity = recognizer.velocity(in: self.view)
        
        let y = self.view.frame.minY
        if (y + translation.y >= fullView) && (y + translation.y <= partialView) {
            self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
        
        if recognizer.state == .ended {
            var duration =  velocity.y < 0 ? Double((y - fullView) / -velocity.y) : Double((partialView - y) / velocity.y )
            
            duration = duration > 1.3 ? 1 : duration
            
            UIView.animate(withDuration: duration, delay: 0.0, options: [.allowUserInteraction], animations: {
                if  velocity.y >= 0 {
                    self.minimize()
                } else {
                    self.maximize()
                }
                
            }, completion: { [weak self] _ in
                if ( velocity.y < 0 ) {
                    self?.tableView.isScrollEnabled = true
                }
            })
        }
    }
    
    func minimize() {
        if self.isMinimize {
            UIView.animate(withDuration: 1, delay: 0.0, options: [.allowUserInteraction], animations: {
                self.dismiss(animated: true, completion: nil)
                return
            }, completion: nil)
        }
        self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
        self.isMinimize = true
    }
    
    func maximize() {
        self.view.frame = CGRect(x: 0, y: self.fullView, width: self.view.frame.width, height: self.view.frame.height)
        self.isMinimize = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupBottomSheet() {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            let frame = self?.view.frame
            let yComponent = self?.fullView
            self?.view.frame = CGRect(x: 0, y: yComponent!, width: frame!.width, height: frame!.height - self!.fullView)
        })
    }
}

extension SortController: SortView {
    
}

extension SortController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let gesture = (gestureRecognizer as! UIPanGestureRecognizer)
        let direction = gesture.velocity(in: view).y
        
        let y = view.frame.minY
        if (y == fullView && tableView.contentOffset.y == 0 && direction > 0) || (y == partialView) {
            tableView.isScrollEnabled = false
        } else {
            tableView.isScrollEnabled = true
        }
        return false
    }
}
