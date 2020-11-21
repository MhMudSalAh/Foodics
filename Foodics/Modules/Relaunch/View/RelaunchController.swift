//
//  RelaunchController.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

class RelaunchController: BaseController {
    
    @IBOutlet weak var lblTitle: UILabel!
    var presenter: RelaunchPresenterInterface!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupView()
    }

    func setupView() {
        lblTitle.text = localizedText("foodics")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
}
    
extension RelaunchController: RelaunchView {

}
