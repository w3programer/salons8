import UIKit
import Font_Awesome_Swift
class LoginVC: UIViewController {
    @IBOutlet weak var TFPassword: UITextField!
    @IBOutlet weak var TFEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        TFEmail.setLeftViewFAIcon(icon: .FAUserO, leftViewMode: .always, textColor: .lightGray, backgroundColor: .clear, size: nil)
        TFPassword.setLeftViewFAIcon(icon: .FALock, leftViewMode: .always, textColor: .lightGray, backgroundColor: .clear, size: nil)
        if CheckInternet.Connection(){

        }else{
            self.showAlert(message: NSLocalizedString("no internet access", comment: ""))
        }
    }


    @IBAction func BULogin(_ sender: UIButton) {
        let user = TFEmail.text!
        let pass = TFPassword.text!
        Api.login(user_phone: user.replacedArabicDigitsWithEnglish , password:pass) { (error:Error?, success :Bool) in
            if success {
              print("success log in")
            }else {
                print("failed")
            }
        }
        
        
    }
    @IBAction func BUForget(_ sender: UIButton) {
        
    }
    
    
    @IBAction func BUSkip(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeStoryBoard") as! HomeVC
        navigationController?.pushViewController(vc,animated: true)
    }
}

