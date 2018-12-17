//
//  ProfileServiceVC.swift
//  Salonat
//
//  Created by salman on 10/24/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit


class ProfileServiceVC: UIViewController{
   
    @IBOutlet weak var tableViewList: UITableView!

    var arr = ["Body massage","Manicure","The pedicure","Nail dye","Manicure installation","Eyelashes","Makeup","facial hair","Preparing a bride","Children's hair","Manicure and pedicure"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
    }

}
extension ProfileServiceVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ProfileServiceCell = tableView.dequeueReusableCell(withIdentifier: "serviceCell", for: indexPath) as! ProfileServiceCell
        cell.KindLabel.text = arr[indexPath.row]
        return cell
    }
    
    
}
