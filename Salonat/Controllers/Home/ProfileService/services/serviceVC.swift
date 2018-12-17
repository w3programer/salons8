import UIKit
import SelectionList
class serviceVC: UIViewController  {
    var salonid:String?
    var salontype = "1"
    var servicearr  = [servicesModel]()
    var items = [subservicesModel]()

    @IBOutlet weak var serviceTable: UITableView!
    override func viewDidLoad() {
           super.viewDidLoad()
        
        serviceTable.tableFooterView = UIView()
        serviceTable.estimatedRowHeight = 80
        serviceTable.rowHeight = UITableView.automaticDimension
           self.refreshtable()
    }

    @IBAction func salonsegment(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.salontype = "1"
            self.refreshtable()
        }else{
            self.salontype = "2"
            self.refreshtable()
            
        }
        
    }
    func refreshtable()  {
        Api.salonServices(salonid: self.salonid!, type: self.salontype) { (error:Error?, data:[servicesModel]?) in
            self.servicearr = data!
            
            self.serviceTable.reloadData()
        }
    }
}
extension serviceVC : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if servicearr[section].expanded == true {
//            return servicearr[section].sub_service.count
//        }else{
//            return 1
//        }
       return servicearr.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = serviceTable .dequeueReusableCell(withIdentifier: "serviceCell", for: indexPath) as! ServiceCell
            cell.serviceName.text = servicearr[indexPath.row].category_title
        
        let subservice = servicearr[indexPath.section].sub_service
        for data in subservice {
            if let data = data.dictionary ,let info = subservicesModel.init(dic: data) {
                items.append(info)
            }
            cell.itemarr =  ["\(items[indexPath.row].service_title!)"]

        }
            return cell  
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let content = servicearr[indexPath.row]
        content.expanded = true
        serviceTable.reloadRows(at: [indexPath], with: .automatic)
    }
}
