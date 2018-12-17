//
//  API+Select.swift
//  Salonat
//
//  Created by salman on 11/4/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import Alamofire
import  SwiftyJSON

extension Api {
    
    class func selectCountry(completion:@escaping(_ error :Error? ,_ data:[Country]?)->Void){
        let BaseUrl = config.country
       
        Alamofire.request(BaseUrl)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , nil)
                case .success(let value):
                    let json = JSON(value)
                 // print(json)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [Country]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = Country.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }
    
    class func selectCity(completion:@escaping(_ error :Error? ,_ data:[City]?)->Void){
        let BaseUrl = config.city
        
        Alamofire.request(BaseUrl)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , nil)
                case .success(let value):
                    let json = JSON(value)
                // print(json)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [City]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = City.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }
    
    
    class func selectTerms(completion:@escaping(_ error :Error? ,_ data:[Terms]?)->Void){
        let BaseUrl = config.terms
        
        Alamofire.request(BaseUrl)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , nil)
                case .success(let value):
                    let json = JSON(value)
//                    print(json)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [Terms]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = Terms.init(dic: data) {
                            results.append(info)
                            
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }
    
    class func selectBank(completion:@escaping(_ error :Error? ,_ data:[Bank]?)->Void){
        let BaseUrl = config.bank
        
        Alamofire.request(BaseUrl)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , nil)
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [Bank]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = Bank.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }
    
    class func selectSocialMedia(completion:@escaping(_ error :Error? ,_ data:[SocialMedia]?)->Void){
        let BaseUrl = config.bank
        
        Alamofire.request(BaseUrl)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , nil)
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [SocialMedia]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = SocialMedia.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }
}
