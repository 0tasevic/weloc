//
//  MyTableViewCell.swift
//  myLocation
//
//  Created by Milos Otasevic on 25/02/2019.
//  Copyright © 2019 Milos Otasevic. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var imageLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
