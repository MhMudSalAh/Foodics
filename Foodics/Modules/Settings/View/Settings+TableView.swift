//
//  Settings+TableView.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit
import SkeletonView

extension SettingsController: UITableViewDelegate, SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "SettingsBtnCell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue(cellClass: SettingsBtnCell.self)
        cell.lbl.text = localizedText("language")
        cell.btn.setTitle(localizedText("current_language"), for: .normal)
        cell.delegate = self
        return cell
        
    }
}
