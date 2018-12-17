//
//  API+Registration.swift
//  Salonat
//
//  Created by salman on 10/28/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class Api: NSObject {
    class var isconnectedtotheinternet:Bool{
        return NetworkReachabilityManager()!.isReachable
    }
    class func registration(
        user_pass:String ,user_phone:String ,user_country:String,user_email:String,user_full_name:String,user_token_id:String,user_google_lat:String,user_google_long:String,user_city:String,user_address:String,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = config.registration
        let parameters = [
            "user_pass":user_pass,
            "user_phone": user_phone,
            "user_country":user_country,
            "user_email": user_email,
            "user_full_name":user_full_name,
            "user_token_id":user_token_id,
            "user_google_lat":user_google_lat,
            "user_google_long":user_google_long,
            "user_city":user_city,
            "user_address":user_address
        ]
        Alamofire.request(BaseUrl, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , false)
                case .success(let value):
                    var data = JSON(value)
                    print(data)
                    if  ((data["success_signup"].int) == 1 ) {
                        let user_id = Int(data["user_id"].string!)!
                        let user_full_name = data["user_full_name"].string
                        let user_phone = data["user_phone"].string
                        let user_address = data["user_address"].string
                        let country = data["ar_name"].string
                        let city_title = data["ar_city_title"].string
                        let email = data["user_email"].string

                        Helper.setUserData(user_id: user_id,user_full_name: user_full_name!,user_phone:user_phone!,user_address:user_address!,country:country!,city_title:city_title!, email: email!)

                        completion(nil ,true)
                    }
                }
                
        }
        
    }
    //////////////all offers
    
    
}


