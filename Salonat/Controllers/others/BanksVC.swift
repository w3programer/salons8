
import UIKit

class BanksVC: BaseViewController,UITableViewDataSource,UITableViewDelegate {

var accounts = [banksModel]()
    @IBOutlet weak var bankTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSlideMenuButton()
        self.title = NSLocalizedString("Banks Accounts", comment: "")
        self.bankTable.tableFooterView = UIView()
        self.refreshtable()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return accounts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bankTable.dequeueReusableCell(withIdentifier: "bank" ,for: indexPath) as! banccellVC
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.bankName.text = accounts[indexPath.row].account_bank_name
        cell.iban.text = "إيبان / " + accounts[indexPath.row].account_IBAN!
        cell.bankNumber.text = "رقم الحساب / " + accounts[indexPath.row].account_number!
        return cell
 
    }
    func refreshtable()  {
        Api.banksAccount { (error:Error?, data:[banksModel]?) in
            self.accounts = data!
            self.bankTable.reloadData()
        }
        
        
    }

}
