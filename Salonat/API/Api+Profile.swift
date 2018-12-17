

import UIKit
import Alamofire
import  SwiftyJSON
extension Api {
    class func updateProfile(
        user_phone:String ,email:String ,user_country:String,user_city:String,user_address:String,user_full_name:String,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = config.contactUs
        let parameters = [
            "user_phone":user_phone,
            "user_email": email,
            "user_address":user_address,
            "user_country":user_country,
            "user_full_name":user_full_name,
            "user_city":user_city,

            ]
        Alamofire.request(BaseUrl, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , false)
                case .success(let value):
                    let data = JSON(value)
                    print(data)
                    if  (data["success_signup"].int == 1) {
                        completion(nil ,true)
                    }
                }
                
        }
        
    }
}

