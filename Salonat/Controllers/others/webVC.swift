
import UIKit
import WebKit
class webVC: BaseViewController {
    var urlstr = ""
   var titlestr = ""
    @IBOutlet var WebView: WKWebView!
    override func viewDidLoad() {
        self.addSlideMenuButton()
        super.viewDidLoad()
        print(urlstr)
        print(titlestr)
      self.title = self.titlestr
        let myURL = URL(string: self.urlstr)
        let myRequest = URLRequest(url: myURL!)
        WebView.load(myRequest)
    }
    
}
