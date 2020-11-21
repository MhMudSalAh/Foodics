//
//  SettingsBtnCell.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/20/20.
//

import UIKit

protocol ButtonDelegate {
    func didClicked(_ cell: UITableViewCell)
}

class SettingsBtnCell: UITableViewCell {
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    var delegate: ButtonDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func btnAction(_ sender: Any) {
        delegate?.didClicked(self)
    }
}
