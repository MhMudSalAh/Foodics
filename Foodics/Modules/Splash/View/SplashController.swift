//
//  SplashController.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

class SplashController: BaseController {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var presenter: SplashPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        presenter.viewDidLoad()
        lblTitle.text = localizedText("foodics")
    }
}

extension SplashController: SplashView {
    
}
