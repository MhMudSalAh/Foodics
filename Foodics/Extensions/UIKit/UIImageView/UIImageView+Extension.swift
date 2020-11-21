//
//  UIImageView+Extension.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func loadImage(_ urlString: String?) {
        let imagePlaceholder = UIImage(named: "placeholder")
        if let urlString = urlString, let url = URL(string: urlString) {
            self.sd_setImage(with: url, placeholderImage: imagePlaceholder) { (image, error, cacheType, url) -> Void in
                if error != nil {
                    self.image = imagePlaceholder
                }
            }
            return
        }
        self.image = imagePlaceholder
    }
}
