import UIKit
import Alamofire
import  SwiftyJSON
extension Api {
    class func myreservactions(completion:@escaping(_ error :Error? ,_ data:[reservactionsModel]?)->Void){
        let BaseUrl = config.myResevation+"\(Helper.getuserid())"
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
                    var results = [reservactionsModel]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = reservactionsModel.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
        }
    }
    
}
