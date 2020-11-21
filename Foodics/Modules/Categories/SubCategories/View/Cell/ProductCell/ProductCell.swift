//
//  ProductCell.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewContainerImg: UIView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
        
    func setupCell(_ product: Product) {
        imgProduct.loadImage(product.image)
        if LOCAL.getLanguage() == Language.EN.rawValue {
            lblTitle.text = product.titleEn
        } else {
            lblTitle.text = product.titleAr
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.cornerRadiusTop(self.viewContainerImg)
        }
    }
}
