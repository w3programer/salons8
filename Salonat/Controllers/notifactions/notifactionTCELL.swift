//
//  notifactionTCELL.swift
//  Salonat
//
//  Created by Hesham on 12/11/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit

class notifactionTCELL: UITableViewCell {

    @IBOutlet weak var statueNote: UILabel!
    @IBOutlet weak var salonName: UILabel!
    @IBOutlet weak var datenote: UILabel!
    @IBOutlet weak var salonPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
