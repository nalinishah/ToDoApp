//
//  CategoryTableViewCell.swift
//  ToDoApp
//
//  Created by nalinis on 8/1/17.
//  Copyright © 2017 nalinis. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
