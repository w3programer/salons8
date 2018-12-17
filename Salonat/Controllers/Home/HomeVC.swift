import UIKit
class HomeVC: BaseViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var notifaction: UIBarButtonItem!
    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet weak var activityindecator: UIActivityIndicatorView!
    var salonsArr = [salonsModel]()
    override func viewDidLoad() {
        self.addSlideMenuButton()
        print("userid\(Helper.getuserid())")
        super.viewDidLoad()
        self.tableViewList.tableFooterView = UIView()
        self.activityindecator.transform = CGAffineTransform(scaleX: 3, y: 3)
        tableViewList.delegate = self
        tableViewList.dataSource = self
        notifaction.setFAIcon(icon: .FABell, iconSize: 30)
        self.activityindecator.isHidden = false
        self.tableViewList.isHidden = true
        self.activityindecator.startAnimating();
        if CheckInternet.Connection(){
            self.refreshtable()
        }else{
           self.showAlert(message: NSLocalizedString("no internet access", comment: ""))
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.activityindecator.isHidden = true
        self.tableViewList.isHidden = false
        self.activityindecator.stopAnimating()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return salonsArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewList.dequeueReusableCell(withIdentifier: "HomeCell" ,for: indexPath) as! HomeCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.Name.text = salonsArr[indexPath.row].title
        cell.KindSalon.text = NSLocalizedString("femail", comment: "kind")
        cell.Country.text = salonsArr[indexPath.row].address
        cell.Rate.rating = Double(salonsArr[indexPath.row].salon_stars_num ?? Int(1.0))
        let url = URL(string: salonsArr[indexPath.row].main_photo!)
        cell.salonPhoto.kf.setImage(with: url)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "salonDetailSeguie", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "salonDetailSeguie" {
            let destinationVC = segue.destination as! ProfileVC
            destinationVC.salondata = salonsArr[(tableViewList.indexPathForSelectedRow?.row)!]

        }
        
    }
    func refreshtable()  {
        Api.salons { (error:Error?, data:[salonsModel]?) in
            self.salonsArr = data!
           self.tableViewList.reloadData()
        }
    }
    
    @IBAction func notifaction(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "notifactionSegue", sender: self)
    }
    
    
}

