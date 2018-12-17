//
//  contactVC.swift
//  Salonat
//
//  Created by Hesham on 12/9/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class contactVC: BaseViewController {
    var urlforweb = ""
    var titlestr = ""
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var message: UITextField!
    var facebook = ""
    var twitter = ""
    var gmail = ""
    var instigram = ""
    var watsapp = ""
    var phone = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSlideMenuButton()
        self.title = NSLocalizedString("Contact US", comment: "")
       self.setdata()
        
    }

    
    func setdata()  {
        Alamofire.request(config.socialMedia).responseJSON{response in
            switch response.result
            {
            case.failure(let error):
                print(error)
            case.success(let value):
                let json = JSON(value)
                self.facebook = json["facebook"].object as! String
                self.twitter = json["twitter"].object as! String
                self.gmail = json["email"].object as! String
                self.instigram = json["instagram"].object as! String
                self.watsapp = json["whatsapp"].object as! String
                self.phone = json["phone"].object as! String

            }
        }
    }
    
    
    
    @IBAction func facebook(_ sender: UIButton) {
    
        self.titlestr = NSLocalizedString("facebook", comment: "whatsapp")
        self.urlforweb = self.facebook
        self.performSegue(withIdentifier: "webSeguie", sender: self)

    
    }
    @IBAction func twitier(_ sender: UIButton) {
        self.titlestr = NSLocalizedString("twitter", comment: "whatsapp")
        self.urlforweb = self.twitter
        self.performSegue(withIdentifier: "webSeguie", sender: self)

    }
    @IBAction func inistgram(_ sender: UIButton) {
        self.titlestr = NSLocalizedString("instigram", comment: "whatsapp")
        self.urlforweb = self.instigram
        self.performSegue(withIdentifier: "webSeguie", sender: self)

    }
    @IBAction func whatsapp(_ sender: UIButton) {
        
        let urlWhats = "whatsapp://send?phone=\(self.watsapp)?text=Hi"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL){
                    UIApplication.shared.open(whatsappURL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
                }
                else {
                    print("Install Whatsapp")
                }
            }
        }
        

        
    }
    @IBAction func gmail(_ sender: UIButton) {
        let url = NSURL(string: "mailto:\(self.gmail)")
        UIApplication.shared.open(url! as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)

    }
    @IBAction func call(_ sender: UIButton) {
        let url: NSURL = URL(string: "TEL://\(self.phone)")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    @IBAction func banks(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "banksegue", sender: self)

    }
    
    
    
    @IBAction func send(_ sender: UIButton) {
        Api.ContactUs(name: name.text!, email: subject.text!, message: message.text!) {(error:Error?, success:Bool) in
            let title:String = NSLocalizedString("report", comment: "")
            let message:String = NSLocalizedString("message sent success", comment: "")
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert,animated: true)
        }
    }
        
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "webSeguie" {
        let destinationVC = segue.destination as! webVC
        destinationVC.titlestr = self.titlestr
        destinationVC.urlstr = self.urlforweb
    }
}
    
    fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
        return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
    }
}

