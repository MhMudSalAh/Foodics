//
//  SubCategories+TableView.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit
import SkeletonView

extension SubCategoriesController: UICollectionViewDelegate, SkeletonCollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        collectionViewProducts.initialize(cellClass: ProductCell.self, delegate: self, dataSource: self)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshControl.isRefreshing && scrollView.contentOffset.y < 0 {
            presenter.getProducts(category.id!, meta.currentPage!)
        } else {
            endRefresher()
        }
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "ProductCell"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = collectionView.frame.size
        size.width = size.width / 2  - 15
        size.height = 300
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: ProductCell.self, indexPath: indexPath)
        cell.hideSkeleton()
        cell.setupCell(products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //delegate?.getProduct(products[indexPath.row])
        presenter.presentSort(products[indexPath.row])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.presenter.didSelectProduct()
        }
    }
}

