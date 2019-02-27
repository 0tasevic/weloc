//
//  LocationViewController.swift
//  myLocation
//
//  Created by Milos Otasevic on 25/02/2019.
//  Copyright © 2019 Milos Otasevic. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var lot: UILabel!
    @IBOutlet weak var lat: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lot.text = "\(LOT)"
        lat.text = "\(LAT)"
    }
    

}
