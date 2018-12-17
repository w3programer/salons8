//
//  profileVC.swift
//  Salonat
//
//  Created by Hesham on 11/26/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit

class userProfile: BaseViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var WalleImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var adress: UITextField!
    let def = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
       self.addSlideMenuButton()
        self.title = (def.object(forKey: "user_full_name") as! String)
        self.username.text = def.object(forKey: "user_full_name") as? String
        self.email.text = def.object(forKey: "email") as? String
        self.adress.text = def.object(forKey: "user_address") as? String
        self.phone.text = def.object(forKey: "user_phone") as? String
    }
    
    @IBAction func updateProfile(_ sender: UIBarButtonItem) {
        let phone = self.phone.text!

        Api.updateProfile(user_phone:phone.replacedArabicDigitsWithEnglish , email: email.text!, user_country: def.object(forKey: "country") as! String, user_city: def.object(forKey: "city_title") as! String, user_address: adress.text!, user_full_name: username.text!) { (error:Error?, result:Bool?) in
            
            self.showAlert(message: NSLocalizedString("success update", comment: "dd"))
        }
    }
    
}
