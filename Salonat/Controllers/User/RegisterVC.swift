//
//  RegisterVC.swift
//  Salonat
//
//  Created by salman on 10/23/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import CoreLocation

class RegisterVC: UIViewController,CLLocationManagerDelegate {

    var imagepicker:UIImagePickerController!
    
    let genderArr = [NSLocalizedString("Mail", comment: ""),NSLocalizedString("Femail", comment: "")]
    let Arr = [NSLocalizedString("arabic", comment: ""),NSLocalizedString("english", comment: "")]
    var pickerview = UIPickerView()
    var pickerview1 = UIPickerView()

    
    @IBOutlet weak var TFName: UITextField!
    @IBOutlet weak var TFEmail: UITextField!
    @IBOutlet weak var TFCountry: UITextField!
    @IBOutlet weak var TFCity: UITextField!
    @IBOutlet weak var TFAddress: UITextField!
    @IBOutlet weak var TFPhone: UITextField!
    @IBOutlet weak var TFPassword: UITextField!
    
    let locationmanager = CLLocationManager()
    var location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var marketDestination:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        TFCountry.inputView = pickerview
        TFCity.inputView = pickerview1

        pickerview.dataSource = self
        pickerview.delegate = self
        pickerview1.dataSource = self
        pickerview1.delegate = self

        font_awsm()

        // Do any additional setup after loading the view.
    }
    

    
    func font_awsm(){
        TFName.setLeftViewFAIcon(icon: .FAUserO, leftViewMode: .always, textColor: UIColor(hexString: "#F1CCD3FF")!, backgroundColor: .clear, size: nil)
        TFEmail.setLeftViewFAIcon(icon: .FAEnvelope, leftViewMode: .always, textColor: UIColor(hexString: "#F1CCD3FF")!, backgroundColor: .clear, size: nil)
        TFCountry.setLeftViewFAIcon(icon: .FAMapPin, leftViewMode: .always, textColor: UIColor(hexString: "#F1CCD3FF")!, backgroundColor: .clear, size: nil)
        TFCity.setLeftViewFAIcon(icon: .FAMapPin, leftViewMode: .always, textColor: UIColor(hexString: "#F1CCD3FF")!, backgroundColor: .clear, size: nil)
        TFPhone.setLeftViewFAIcon(icon: .FAMapPin, leftViewMode: .always, textColor: UIColor(hexString: "#F1CCD3FF")!, backgroundColor: .clear, size: nil)
        TFAddress.setLeftViewFAIcon(icon: .FAMapPin, leftViewMode: .always, textColor: UIColor(hexString: "#F1CCD3FF")!, backgroundColor: .clear, size: nil)
        TFPassword.setLeftViewFAIcon(icon: .FALock, leftViewMode: .always, textColor: UIColor(hexString: "#F1CCD3FF")!, backgroundColor: .clear, size: nil)
    }

    
    func locateWithLongitude(_ lon: Double, andLatitude lat: Double, andTitle title: String) {
        DispatchQueue.main.async { () -> Void in
            
            let destination = CLLocation(latitude:lat , longitude:lon)
            self.marketDestination.longitude = lon
            self.marketDestination.latitude = lat
            
        
            
        }
    }
  
    @IBAction func register(_ sender: UIButton) {
        
        guard let username = TFName.text,!username.isEmpty else {return}
        guard let email = TFEmail.text,!email.isEmpty else{return}
        guard let country = TFCountry.text,!country.isEmpty else{return}
        guard let city = TFCity.text,!city.isEmpty else{return}
        guard let address = TFAddress.text,!address.isEmpty else{return}
        guard let phone = TFPhone.text,!phone.isEmpty else{return}
        guard let Password = TFPassword.text,!Password.isEmpty else{return}
//
//        Api.registration(user_pass: Password, user_phone: phone, user_country: <#T##String#>, user_email: <#T##String#>, user_full_name: <#T##String#>, user_token_id: <#T##String#>, user_google_lat: <#T##String#>, user_google_long: <#T##String#>, user_city: <#T##String#>, user_address: <#T##String#>, completion: <#T##(Error?, Bool) -> Void#>)

    }
    
}


extension RegisterVC : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return genderArr[row]

        } else {
            return Arr[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            TFCountry.text = genderArr[row]
            TFCountry.resignFirstResponder()
        } else {
            TFCity.text = Arr[row]
            TFCity.resignFirstResponder()

        }
        
    }
}
