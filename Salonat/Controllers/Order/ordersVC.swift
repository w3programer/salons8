
import UIKit
class ordersVC: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var indecator: UIActivityIndicatorView!
    @IBOutlet weak var ordersTable: UITableView!
    var orderarray = [reservactionsModel]()
    override func viewDidLoad() {
        self.addSlideMenuButton()
        super.viewDidLoad()
        self.ordersTable.tableFooterView = UIView()
        self.indecator.transform = CGAffineTransform(scaleX: 3, y: 3)
        self.indecator.isHidden = false
        self.ordersTable.isHidden = true
        self.indecator.startAnimating();
        if CheckInternet.Connection(){
            self.refreshtable()
        }else{
            self.showAlert(message: NSLocalizedString("no internet access", comment: ""))
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.indecator.isHidden = true
        self.ordersTable.isHidden = false
        self.indecator.stopAnimating()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderarray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ordersTable.dequeueReusableCell(withIdentifier: "orderCell" ,for: indexPath) as! ordersCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.salonNmae.text = orderarray[indexPath.row].title
        cell.orderdate.text = orderarray[indexPath.row].reservation_date_st
        let url = URL(string: orderarray[indexPath.row].main_photo!)
        cell.salonphoto.kf.setImage(with: url)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "redetailesSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! orderDetailes
        destinationVC.detailes = orderarray[(ordersTable.indexPathForSelectedRow?.row)!]
        
    }
    func refreshtable()  {
        Api.myreservactions { (error:Error?, data:[reservactionsModel]?) in
            self.orderarray = data!
            self.ordersTable.reloadData()
        }
    }
}
