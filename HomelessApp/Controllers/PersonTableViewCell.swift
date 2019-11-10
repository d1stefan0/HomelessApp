//
//  PersonTableViewCell.swift
//  HomelessApp
//
//  Created by user on 11/10/19.
//  Copyright © 2019 DiStefanoTeam. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var eatLabel: UILabel!
    @IBOutlet weak var happinessLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let theme = Theme.currentTheme
        backgroundColor = theme.bgColor
        healthLabel.textColor = theme.textColor
        eatLabel.textColor = theme.textColor
        happinessLabel.textColor = theme.textColor
        moneyLabel.textColor = theme.textColor
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
