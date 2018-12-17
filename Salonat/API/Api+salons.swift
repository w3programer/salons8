
import UIKit
import Alamofire
import  SwiftyJSON

extension Api {
    
    class func salons(completion:@escaping(_ error :Error? ,_ data:[salonsModel]?)->Void){
        let BaseUrl = config.allSalons
        
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
                    var results = [salonsModel]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = salonsModel.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }
    
}
