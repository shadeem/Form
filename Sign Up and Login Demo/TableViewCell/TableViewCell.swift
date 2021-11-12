//
//  TableViewCell.swift
//  Sign Up and Login Demo
//
//  Created by Sheraz Hussain on 10/11/2021.
//  Copyright © 2021 Sheraz Hussain. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
       @IBOutlet weak var myImageView: UIImageView!
       @IBOutlet weak var myNameLabel: UILabel!
       @IBOutlet weak var mylabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
