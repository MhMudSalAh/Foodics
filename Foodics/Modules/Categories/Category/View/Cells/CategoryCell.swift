//
//  CategoryCell.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    func setupCell(_ category: Category) {
        if LOCAL.getLanguage() == Language.EN.rawValue {
            lblTitle.text = category.titleEn
        } else {
            lblTitle.text = category.titleAr
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
