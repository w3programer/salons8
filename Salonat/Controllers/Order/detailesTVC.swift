//
//  detailesTVC.swift
//  Salonat
//
//  Created by Hesham on 12/11/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit

class detailesTVC: UITableViewCell {

    @IBOutlet weak var servicetitle: UILabel!
    
    @IBOutlet weak var cost: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
