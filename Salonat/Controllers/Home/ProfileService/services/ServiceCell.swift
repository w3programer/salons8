//
//  ServiceCell.swift
//  Salonat
//
//  Created by Hesham on 11/29/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import SelectionList
class ServiceCell: UITableViewCell {
    @IBOutlet weak var selectionList: SelectionList!
    @IBOutlet weak var serviceName: UILabel!
    var itemarr = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        //selectionList.items = ["One", "Two", "Three", "Four", "Five"]
      //  selectionList.selectedIndexes = [0, 1, 4]
        selectionList.allowsMultipleSelection = true
        selectionList.items = itemarr
        selectionList.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        selectionList.setupCell = { (cell: UITableViewCell, _: Int) in
            cell.textLabel?.textColor = .gray
        }
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @objc func selectionChanged (){
        print(selectionList.selectedIndexes)
        
    }


}
