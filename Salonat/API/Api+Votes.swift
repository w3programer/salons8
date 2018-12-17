
import UIKit
import Alamofire
import  SwiftyJSON
extension Api {
    
    class func votes(salonid:String,type:String,completion:@escaping(_ error :Error? ,_ data:[voteModel]?)->Void){
        let BaseUrl = config.CustomerOpinions + salonid + "/" + type
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
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [voteModel]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = voteModel.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }
    
}
