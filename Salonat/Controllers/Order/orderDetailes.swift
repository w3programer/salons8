//
//  orderDetailes.swift
//  Salonat
//
//  Created by Hesham on 12/11/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import SwiftyJSON
import Font_Awesome_Swift
class orderDetailes: BaseViewController,UITableViewDelegate,UITableViewDataSource {
   //detailesTVC
    var detailes:reservactionsModel?
    @IBOutlet weak var salonImage: UIImageView!
    @IBOutlet weak var salonname: UILabel!
    @IBOutlet weak var salonphone: UILabel!
    @IBOutlet weak var salonPlace: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var totalcost: UILabel!
    @IBOutlet weak var tablelist: UITableView!
    var servicearr = [services]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSlideMenuButton()
        self.title = detailes?.reservation_date_st
        self.getdata()
//        salonphone.setFAIcon(icon: .FAPhone, iconSize: 15)
//        salonPlace.setFAIcon(icon: .FAMap, iconSize: 15)
//        date.setFAIcon(icon: .FACalendar, iconSize: 15)
//        totalcost.setFAIcon(icon: .FAMoney, iconSize: 15)

        self.tablelist.tableFooterView = UIView()
        self.tablelist.reloadData()
    }
    
    
    func getdata() {
        
        let url = URL(string: (detailes?.main_photo)!)
       salonImage.kf.setImage(with: url)
        salonname.text = detailes?.title
        salonphone.text = detailes?.phone
        salonPlace.text = detailes?.address
        date.text  = detailes?.approved_date
        totalcost.text = "\(detailes?.reservation_cost ?? "0")SR"
        let dataArr = detailes?.reservation_sevice
        for data in dataArr! {
            if let data = data.dictionary ,let info = services.init(dic: data) {
                servicearr.append(info)
            }
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicearr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tablelist.dequeueReusableCell(withIdentifier: "detailesTVC" ,for: indexPath) as! detailesTVC
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.servicetitle.text = servicearr[indexPath.row].service_title
        cell.cost.text = servicearr[indexPath.row].salon_cost
        cell.time.text = servicearr[indexPath.row].salon_time_take
        return cell
    }
}
