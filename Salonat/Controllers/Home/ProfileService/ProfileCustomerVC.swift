//
//  ProfileCustomerVC.swift
//  Salonat
//
//  Created by salman on 10/26/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
protocol CustomerViewDelegate: class {
    func sendToThirdViewController()
}
class ProfileCustomerVC: UIViewController {
    @IBOutlet weak var tableViewList: UITableView!
    
    weak var delegate: CustomerViewDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewList.delegate = self
        tableViewList.dataSource = self

        // Do any additional setup after loading the view.
    }
    

}
extension ProfileCustomerVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProfileCustomerCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCustomerCell", for: indexPath) as! ProfileCustomerCell
        return cell
    }
    
}
