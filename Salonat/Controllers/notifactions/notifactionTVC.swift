//
//  notifactionTVC.swift
//  Salonat
//
//  Created by Hesham on 12/11/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import Kingfisher
class notifactionTVC: UITableViewController {

    @IBOutlet var notTable: UITableView!
    var notifacation = [notifactionModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notTable.tableFooterView = UIView()

        refreshtable()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notifacation.count
    }



    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notTable.dequeueReusableCell(withIdentifier: "notifactionCell" ,for: indexPath) as! notifactionTCELL
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.datenote.text = notifacation[indexPath.row].approved_date
        cell.salonName.text = notifacation[indexPath.row].title
        let url = URL(string: notifacation[indexPath.row].main_photo!)
        cell.salonPhoto.kf.setImage(with: url)
        let approved = (notifacation[indexPath.row].approved! as NSString).integerValue
        if approved == 1  {
          cell.statueNote.text = "تم الموافقه على المعاد و يمكنك الدخول للدفع"
        } else if approved == 2{
          cell.statueNote.text = "تم رفض المعاد"
        }else if approved == 4{
          cell.statueNote.text = "تم الموافقه"
        }else if approved == 5{
         cell.statueNote.text = "تم الرفض"
        }
        

        return cell
        
    }
    func refreshtable()  {
        Api.notifactions { (error:Error?, data:[notifactionModel]?) in
            self.notifacation = data!
            self.notTable.reloadData()
        }
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
