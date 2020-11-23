//
//  CategoryView.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit
import SkeletonView

class CategoryController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CategoryPresenterInterface!
    
    var btnNext = UIBarButtonItem()
    var btnPrevious = UIBarButtonItem()
    var btnSettings = UIBarButtonItem()
    
    var meta: Meta? = Meta() {
        didSet {
            if meta?.currentPage ?? 1 < meta?.lastPage ?? 1 {
                btnNext.tintColor = .white
                btnNext.isEnabled = true
            } else {
                btnNext.tintColor = .lightGray
                btnNext.isEnabled = false
            }
            
            if meta?.currentPage == 1 {
                btnPrevious.tintColor = .lightGray
                btnPrevious.isEnabled = false
            } else {
                btnPrevious.tintColor = .white
                btnPrevious.isEnabled = true
            }
        }
    }
    
    var categories: [Category] = [] {
        didSet {
            reloadCategories()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        CategoriesManager().deleteAllCarts()
//        MetasManager().deleteAllMetas()
        meta = MetasManager().retrieve()!
        if meta?.currentPage == nil {
            presenter.getCategories(1)
        } else {
            self.loadLocalCategories(1)
        }
    }
    
    func setupView() {
        navigationItem.title = localizedText("categories")
        initTableView()
        btnNext = UIBarButtonItem(title: localizedText("next"), style: .plain, target: self, action: #selector(didClickNextBtn))
        btnSettings = UIBarButtonItem(title: localizedText("settings"), style: .plain, target: self, action: #selector(didClickSettingsBtn))
        navigationItem.rightBarButtonItems = [btnNext, btnSettings]
        
        btnPrevious = UIBarButtonItem(title: localizedText("previous"), style: .plain, target: self, action: #selector(didClickPreviousBtn))
        navigationItem.leftBarButtonItem = btnPrevious
    }
    
    @objc fileprivate func didClickNextBtn(_ sender: Any?) {
        if meta?.currentPage ?? 1 < meta?.lastPage ?? 1 {
            loadLocalCategories(meta?.currentPage ?? 1 + 1)
        }
    }
    
    @objc fileprivate func didClickPreviousBtn(_ sender: Any?) {
        if meta?.currentPage! != 1 {
            loadLocalCategories(meta?.currentPage ?? 1 - 1)
        }
    }

    @objc fileprivate func didClickSettingsBtn(_ sender: Any?) {
        presenter.didClickSettings()
    }

    func reloadCategories() {
        if !categories.isEmpty {
            hideEmptyScreen()
            tableView.reloadData()
        } else {
            presentEmptyScreen()
        }
    }
    
}

extension CategoryController: CategoryView {
    
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
        showEmptyScreen(.categories, self, view)
    }
    
    func hideEmptyScreen() {
        closeEmptyScreen()
    }

    
    func loadLocalCategories(_ page: Int?) {
        self.hideLoading()
        if page != nil {
            self.categories = CategoriesManager().retrieve(page!) ?? []
        } else {
            self.categories = CategoriesManager().retrieve(1) ?? []
        }
    }
}

extension CategoryController: NetworkScreenControllerDelegate, EmptyScreenControllerDelegate {
    
    func didClickTypeAgain() {
        
    }
}

extension CategoryController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension CategoryController: SortDelegate {
    func getProduct(_ product: Product) {
        presenter.presentSort(product)
    }
}
