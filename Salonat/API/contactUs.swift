

import UIKit
import Alamofire
import  SwiftyJSON
extension Api {
    class func ContactUs(
        name:String ,email:String ,message:String,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = config.contactUs
        let parameters = [
            "name":name,
            "email": email,
            "subject":message,
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
                    if  (data["success_contact"].int == 1) {
                        completion(nil ,true)
                    }
                }
                
        }
        
    }
}

