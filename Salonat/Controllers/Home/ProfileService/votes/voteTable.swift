import UIKit
class voteTable: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var voteArr  = [voteModel]()
    @IBOutlet weak var voteTable: UITableView!
    var salonid:String?
    var salontype = "1"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.voteTable.tableFooterView = UIView()

       self.refreshtable()
    }
    @IBAction func typesegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
         self.salontype = "1"//at salon
            self.refreshtable()
        }else{
            self.salontype = "2"//at home
            self.refreshtable()

        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voteArr.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = voteTable.dequeueReusableCell(withIdentifier: "voteCell" ,for: indexPath) as! voteCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.opinion.text = voteArr[indexPath.row].comment_detail
        cell.customerName.text = voteArr[indexPath.row].comment_person
        cell.voteStars.rating = voteArr[indexPath.row].stars_num?.toDouble() ?? 1.0
        return cell
    }
    
    func refreshtable()  {
        Api.votes(salonid: self.salonid!, type:self.salontype  ) { (error:Error?, data:[voteModel]?) in
            self.voteArr = data!
            self.voteTable.reloadData()
            }
        
        
    }
}
