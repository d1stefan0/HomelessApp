//
//  PlayerTableViewCell.swift
//  HomelessApp
//
//  Created by user on 9/29/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

//@IBDesignable
class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var eatLabel: UILabel!
    @IBOutlet weak var happinessLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
