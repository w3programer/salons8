import UIKit
class RegisterVC: UIViewController {
    var countryCode:String?
    var cityCode:String?
    //    var locationManager:CLLocationManager!
    var pickervieCountry = UIPickerView()
    var pickerviewCity = UIPickerView()
    var countries = [Country]()
    var cities = [City]()
    @IBOutlet weak var TFName: UITextField!
    @IBOutlet weak var TFEmail: UITextField!
    @IBOutlet weak var TFCountry: UITextField!
    @IBOutlet weak var TFCity: UITextField!
    @IBOutlet weak var TFAddress: UITextField!
    @IBOutlet weak var TFPhone: UITextField!
    @IBOutlet weak var TFPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        TFCountry.inputView = pickervieCountry
        TFCity.inputView = pickerviewCity
        pickervieCountry.dataSource = self
        pickervieCountry.delegate = self
        pickerviewCity.dataSource = self
        pickerviewCity.delegate = self
        getCountry()
        font_awsm()
        getCity()
    }
    func getCountry(){
        Api.selectCountry { (error: Error?,info:[Country]?) in
            self.countries = info!
        }
    }
    func getCity(){
        Api.selectCity { (error: Error?,info:[City]?) in
            self.cities = info!
        }
    }
    @IBAction func register(_ sender: UIButton) {
        guard let username = TFName.text,!username.isEmpty else {return}
        guard let email = TFEmail.text,!email.isEmpty else{return}
        guard let address = TFAddress.text,!address.isEmpty else{return}
        guard let phone = TFPhone.text,!phone.isEmpty else{return}
        guard let Password = TFPassword.text,!Password.isEmpty else{return}
        Api.registration(user_pass: Password, user_phone: phone.replacedArabicDigitsWithEnglish, user_country: self.countryCode!, user_email: email, user_full_name: username, user_token_id: "", user_google_lat: username, user_google_long: "12345", user_city: "123456", user_address: address) { (error:Error?, success :Bool) in
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "HomeStoryBoard") as! HomeVC
//            self.navigationController?.pushViewController(vc,animated: true)


        }
    }
}
extension RegisterVC : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickervieCountry {

        return countries.count
        }else{
            return cities.count

        }
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickervieCountry {
            if self.lanuage() == false{
                return countries[row].en_name
                
            }else{
                return countries[row].ar_name
            }
        } else  {
            if self.lanuage() == false{
                return cities[row].en_city_title
            } else{
                return cities[row].ar_city_title
            }
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickervieCountry {
            
            if self.lanuage() == false{
                TFCountry.text = countries[row].en_name
                self.countryCode = countries[row].id_country
                TFCountry.resignFirstResponder()
            } else {
                TFCountry.text = countries[row].ar_name
                self.countryCode = countries[row].id_country
                TFCountry.resignFirstResponder()
            }
        }
         else {
            if self.lanuage() == false{
                TFCity.text = cities[row].en_city_title
                self.cityCode = cities[row].id_city
                TFCity.resignFirstResponder()
            } else {
                TFCity.text = cities[row].ar_city_title
                self.cityCode = cities[row].id_city
                TFCity.resignFirstResponder()
            }
        }
        
    }
    func lanuage() -> Bool {
        let preferredLanguage = Locale.current.languageCode
        if preferredLanguage == "en"{
            return  true
            
        } else{
            return false
            
        }
        
        
    }
    
}
