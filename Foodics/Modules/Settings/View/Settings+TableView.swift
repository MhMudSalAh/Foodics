//
//  Settings+TableView.swift
//  Benaak
//
//  Created by Mohamed Elbana on 1/28/20.
//  Copyright © 2020 Tarseya. All rights reserved.
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
