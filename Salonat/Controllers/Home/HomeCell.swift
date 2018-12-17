//
//  HomeCell.swift
//  Salonat
//
//  Created by salman on 10/23/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import Cosmos

class HomeCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var KindSalon: UILabel!
    @IBOutlet weak var Rate: CosmosView!
    @IBOutlet weak var IVMap: UIImageView!
    @IBOutlet weak var Country: UILabel!
    @IBOutlet weak var salonPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Rate.settings.updateOnTouch = false
        IVMap.setFAIconWithName(icon: .FAMapPin, textColor: .blue) 
    }

  

}
