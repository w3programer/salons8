//
//  API+Login.swift
//  Salonat
//
//  Created by salman on 11/3/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import Alamofire
import  SwiftyJSON
extension Api {
    class func login(user_phone:String ,password:String ,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = config.login
        let parameters = [
            "user_phone":user_phone,
            "user_pass": password
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
                    if (data["success_login"].int != 0) {
//                        let param = [
//                            "user_token_id":messageconfig.getDevicetoken(),
//                            ]
//                        Alamofire.request(config.UpdateTokenId+data["user_id"].string!, method: .post, parameters:
//                            param, encoding: URLEncoding.default, headers: nil)
                        let user_id = Int(data["user_id"].string!)!
                        let user_full_name = data["user_full_name"].string
                        let user_phone = data["user_phone"].string
                        Helper.setUserData(user_id: user_id,user_full_name: user_full_name!,user_phone:user_phone!)
                        completion(nil ,true)
                    }
                    
                }
                
        }
        
    }
    
    
    class func logOut(completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = config.Logout+"\(Helper.getuserid())"
        Alamofire.request(BaseUrl)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , false)
                case .success(let value):
                    let data = JSON(value)
                    if  (data["success_logout"].string != "0") {
                        Helper.logout()
                        completion(nil ,true)
                    }
                    
                }
                
        }
        
    }
    
    
    
    class func ReseetPassword(username:String ,email:String ,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = config.ResetePassword
        let parameters = [
            "user_email": email
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
                    if  (data["success_rest"].string != "0") {
                        completion(nil ,true)
                    }
                    
                }
                
        }
        
    }
}
