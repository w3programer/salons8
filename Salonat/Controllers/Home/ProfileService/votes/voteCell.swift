//
//  voteCell.swift
//  Salonat
//
//  Created by Hesham on 12/8/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import Cosmos
class voteCell: UITableViewCell {

    @IBOutlet weak var opinion: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var voteStars: CosmosView!
    override func awakeFromNib() {
        super.awakeFromNib()
        voteStars.settings.updateOnTouch = false

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
