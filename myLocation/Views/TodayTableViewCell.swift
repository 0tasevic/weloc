//
//  TodayTableViewCell.swift
//  myLocation
//
//  Created by Milos Otasevic on 26/02/2019.
//  Copyright © 2019 Milos Otasevic. All rights reserved.
//

import UIKit

class TodayTableViewCell: UITableViewCell {

    @IBOutlet weak var Day: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
