//
//  Category+TableView.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import Foundation
import SkeletonView

extension CategoryController: UITableViewDelegate, SkeletonTableViewDataSource {
    
    func initTableView() {
        tableView.initialize(cellClass: CategoryCell.self, delegate: self, dataSource: self, estimatedRowHeight: 150)
        tableView.contentInset.top = 10
        tableView.contentInset.bottom = 10
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "CategoryCell"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: CategoryCell.self)
        cell.hideSkeleton()
        cell.setupCell(categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCategory(categories[indexPath.row])
    }
}
