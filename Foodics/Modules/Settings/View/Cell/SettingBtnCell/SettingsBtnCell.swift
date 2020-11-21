//
//  SettingsBtnCell.swift
//  Benaak
//
//  Created by Mohamed Elbana on 1/9/20.
//  Copyright © 2020 Tarseya. All rights reserved.
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
