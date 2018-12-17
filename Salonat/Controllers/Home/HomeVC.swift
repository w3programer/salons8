//
//  HomeVC.swift
//  Salonat
//
//  Created by salman on 10/23/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet weak var BUMenu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewList.delegate = self
        tableViewList.dataSource = self
        BUMenu.setFAIcon(icon: .FANavicon, iconSize: 30)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : HomeCell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        return cell
    }
    
}
