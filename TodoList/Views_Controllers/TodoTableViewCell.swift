//
//  TodoTableViewCell.swift
//  TodoList
//
//  Created by Leonardo Durazo on 29/09/17.
//  Copyright © 2017 Leonardo Durazo. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell, TodoBindeable {
    
    var todo: Todo!
    @IBOutlet weak var completedSwitch: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.sizeToFit()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
