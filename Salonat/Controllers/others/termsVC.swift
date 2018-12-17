import UIKit
import Alamofire
import SwiftyJSON
class termsVC: BaseViewController {
  
    @IBOutlet weak var contentBody: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSlideMenuButton()
        self.title = NSLocalizedString("Terms & Conditions", comment: "terms")
        Alamofire.request(config.terms).responseJSON{response in
            switch response.result
            {
            case.failure(let error):
                print(error)
            case.success(let value):
                let json = JSON(value)
                self.contentBody.text = json["content"].object as? String
            }
        }
        
        
    }

}
