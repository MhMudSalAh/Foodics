//
//  SettingsController.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit
import SkeletonView

class SettingsController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SettingsPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        navigationItem.title = localizedText("settings")
        tableView.initialize(delegate: self, dataSource: self)
    }
}

extension SettingsController: SettingsView {
    
    func showLanguageAlert() {
        let alert = UIAlertController(title: localizedText("change_language_message"), message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: localizedText("english"), style: .default) { action in
            if LOCAL.getLanguage() == Language.AR.rawValue {
                LOCAL.setLocale(.EN, .forceLeftToRight)
                RootRouter().resetApp()
            }
        })
        
        alert.addAction(UIAlertAction(title: localizedText("arabic"), style: .default) { action in
            if LOCAL.getLanguage() == Language.EN.rawValue {
                LOCAL.setLocale(.AR, .forceRightToLeft)
                RootRouter().resetApp()
            }
        })
        
        alert.addAction(UIAlertAction(title: localizedText("cancel"), style: .cancel, handler: nil))
        
        if let popover = alert.popoverPresentationController {
          popover.sourceView = self.view
          popover.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
          popover.permittedArrowDirections = []
        }
        
        self.present(alert, animated: true, completion: nil)

    }
}

extension SettingsController: ButtonDelegate {
    
    func didClicked(_ cell: UITableViewCell) {
        presenter.changeLanguageClicked()
    }
}
