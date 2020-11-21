//
//  SubCategoriesView.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit
import SkeletonView

let SUBCATEGORY = SubCategoriesController.shared
    
class SubCategoriesController: BaseController {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var collectionViewProducts: UICollectionView!
    
    var presenter: SubCategoriesPresenterInterface!
    static let shared = SubCategoriesController()
    var btnNext = UIBarButtonItem()
    var btnPrevious = UIBarButtonItem()
    var delegate: SortDelegate?
    
    var category: Category = Category()
        
    var meta: Meta = Meta() {
        didSet {
            if meta.currentPage! < meta.lastPage! {
                btnNext.tintColor = .white
                btnNext.isEnabled = true
            } else {
                btnNext.tintColor = .lightGray
                btnNext.isEnabled = false
            }
            
            if meta.currentPage == 1 {
                btnPrevious.tintColor = .lightGray
                btnPrevious.isEnabled = false
            } else {
                btnPrevious.tintColor = .white
                btnPrevious.isEnabled = true
            }
        }
    }
    
    var products: [Product] = [] {
        didSet {
            reloadProducts()
        }
    }
    
    var currentIndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupCollectionView()
        
        if category.id != nil {
            presenter.getProducts(category.id!, 1)
        }
        
        if LOCAL.getLanguage() == Language.EN.rawValue {
            navigationItem.title = category.titleEn
        } else {
            navigationItem.title = category.titleAr
        }
        
        btnNext = UIBarButtonItem(title: localizedText("next"), style: .plain, target: self, action: #selector(didClickNextBtn))
        navigationItem.rightBarButtonItem = btnNext
        
        btnPrevious = UIBarButtonItem(title: localizedText("previous"), style: .plain, target: self, action: #selector(didClickPreviousBtn))
        navigationItem.leftBarButtonItem = btnPrevious

    }
        
    @objc fileprivate func didClickNextBtn(_ sender: Any?) {
        if meta.currentPage! < meta.lastPage! {
            presenter.getProducts(category.id!, meta.currentPage! + 1)
        }
    }
    
    @objc fileprivate func didClickPreviousBtn(_ sender: Any?) {
        if meta.currentPage! != 1 {
            presenter.getProducts(category.id!, meta.currentPage! - 1)
        }
    }

    func reloadProducts() {
        if !products.isEmpty {
            hideEmptyScreen()
            collectionViewProducts.reloadData()
        } else {
            presentEmptyScreen()
        }
    }
    
}

extension SubCategoriesController: SubCategoriesView {
    
    func showLoading() {
        view.showAnimatedGradientSkeleton()
    }
    
    func hideLoading() {
        endRefresher()
        view.hideSkeleton()
    }
    
    func presentNetworkErrorScreen() {
        showNetworkErrorScreen(self, self.view)
    }
    
    func hideNetworkErrorScreen() {
        closeNetworkErrorScreen()
    }
    
    func presentEmptyScreen() {
        showEmptyScreen(.products, self, viewContainer)
    }
    
    func hideEmptyScreen() {
        closeEmptyScreen()
    }
}

extension SubCategoriesController: NetworkScreenControllerDelegate, EmptyScreenControllerDelegate {
    
    func didClickTypeAgain() {
        
    }
}

extension SubCategoriesController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
}
