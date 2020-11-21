//
//  EmptyScreenController.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

enum EmptyScreenType {
    
    case products
    case categories
}

@objc protocol EmptyScreenControllerDelegate {
    @objc optional func didClickEmptyScreenBtn()
}

class EmptyScreenController: UIViewController {
    
    @IBOutlet weak var emptyScreenImage: UIImageView!
    @IBOutlet weak var lblEmptyScreenTitle: UILabel!
    @IBOutlet weak var lblEmptyScreenDescription: UILabel!
    
    var type: EmptyScreenType = EmptyScreenType.products
    var delegate: EmptyScreenControllerDelegate?
    var isPresented = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        switch type {
        case .products:
            setupProducts()
        case .categories:
            setupCategories()
        }
    }
    
    func setup(_ title: String, _ description: String,_ imageKey: String, _ isBtnHidden: Bool,_ btnTitle: String?) {
        emptyScreenImage.image = UIImage(named: imageKey)
        lblEmptyScreenTitle.text = localizedText(title)
        lblEmptyScreenDescription.text = localizedText(description)
    }
    
    func showAsSubView(_ view: UIView) {
        isPresented = true
        DispatchQueue.main.async {
            self.view.frame.size = view.frame.size
            view.addSubview(self.view)
        }
    }
    
    func close() {
        isPresented = false
        DispatchQueue.main.async {
            self.view.removeFromSuperview()
        }
    }
}

// MARK: Setup Empty Screen With Different Types

extension EmptyScreenController {
    
    func setupProducts() {
        setup("empty_products_title", "empty_products_description", "emptyPlaceholder", true, nil)
    }
    
    func setupCategories() {
        setup("empty_categories_title", "empty_categories_description", "emptyPlaceholder", true, nil)
    }
}
