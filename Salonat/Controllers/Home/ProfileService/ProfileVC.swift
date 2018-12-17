import UIKit
import AACarousel
import Cosmos
class ProfileVC: BaseViewController,AACarouselDelegate {
    var salondata:salonsModel?
    @IBOutlet weak var carouselView: AACarousel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var caret:UIBarButtonItem!
    @IBOutlet weak var salonRate: CosmosView!
    @IBOutlet weak var SalonName: UILabel!
    @IBOutlet weak var servicecontainer: UIView!
    @IBOutlet weak var votecontainer: UIView!
    @IBOutlet weak var locationcontainer: UIView!
    let location = salonLocationVC()
var badgeofcaret = 0
    var pathArray:[String] = []
    var titleArray = [String]()
    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()

        locationcontainer.alpha = 0
        votecontainer.alpha = 0
        self.addSlideMenuButton()
        self.getdata()
        carouselView.delegate = self
        UINavigationBar.appearance().backgroundColor = UIColor.green
        titleArray = [salondata?.title] as! [String]
        carouselView.setCarouselData(paths: pathArray ,  describedTitle: titleArray, isAutoScroll: true, timer: 5.0, defaultImage: "avatar")
        carouselView.setCarouselOpaque(layer: false, describedTitle: false, pageIndicator: false)
        carouselView.setCarouselLayout(displayStyle: 0, pageIndicatorPositon: 2, pageIndicatorColor: nil, describedTitleColor: .clear, layerColor: .clear)
        carouselView.addSubview(stackView)

    }

    func getdata()  {
        self.title = salondata?.title
        self.salonRate.rating = Double((salondata?.salon_stars_num)!)
        self.salonRate.settings.updateOnTouch = false
        self.SalonName.text = salondata?.title
        for image in (salondata?.gallary)!{
            pathArray.append(image["photo_name"].toImagePath!)
        }
        let notificationButton = SSBadgeButton()
        notificationButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        notificationButton.setImage(UIImage(named: "shopping-cart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        notificationButton.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 18)
        notificationButton.badge = "\(badgeofcaret)"
        notificationButton.addTarget(self, action: #selector(test), for: UIControl.Event.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
    }
    @objc func test (){
       getdata()
//        badgeofcaret += 1
//        print(badgeofcaret)
    }
    func downloadImages(_ url: String, _ index: Int) {
        //here is download images area
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: url)!, placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(0))], progressBlock: nil, completionHandler: { (downloadImage, error, cacheType, url) in
            self.carouselView.images[index] = downloadImage!
        })
    }

//
//    @IBAction func caret(_ sender: UIBarButtonItem) {
//        self.badgeofcaret = 5
//        self.getdata()
//    }
//
    
    
    
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            servicecontainer.alpha = 1
            locationcontainer.alpha = 0
            votecontainer.alpha = 0
        }else if sender.selectedSegmentIndex == 1 {
            servicecontainer.alpha = 0
            locationcontainer.alpha = 1
            votecontainer.alpha = 0

        }else if sender.selectedSegmentIndex == 2 {
            servicecontainer.alpha = 0
            locationcontainer.alpha = 0
            votecontainer.alpha = 1
        }
        
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "locationsegue") {
            let childViewController = segue.destination as! salonLocationVC
            childViewController.lat = salondata?.address_google_lat
            childViewController.long = salondata?.address_google_long
            childViewController.salonname = salondata?.title
            childViewController.adress = salondata?.address
        }else if (segue.identifier == "voteSeguie"){
            let votview = segue.destination as! voteTable
            votview.salonid =  salondata?.id_salon
        }else{
            let service = segue.destination as! serviceVC
            service.salonid =  salondata?.id_salon

        }
    }

}
