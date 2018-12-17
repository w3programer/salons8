//
//  ordersCell.swift
//  Salonat
//
//  Created by Hesham on 12/11/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit

class ordersCell: UITableViewCell {

    @IBOutlet weak var orderdate: UILabel!
    
    @IBOutlet weak var salonNmae: UILabel!
    @IBOutlet weak var salonphoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
