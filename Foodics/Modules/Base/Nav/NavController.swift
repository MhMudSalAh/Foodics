//
//  NavController.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit

var NAV = NavController.shared

class NavController: UINavigationController {
    
    static var shared: NavController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavController.shared = self
        NAV = NavController.shared
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NavController.shared = self
        NAV = NavController.shared
    }
}
