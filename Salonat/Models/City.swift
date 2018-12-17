import UIKit
import SwiftyJSON
public class City:NSObject {
    public var id_city : String?
    public var ar_city_title : String?
    public var en_city_title : String?
    init?(dic:[String:JSON]) {
        guard let id_city = dic["id_city"]?.string ,let ar_city_title = dic["ar_city_title"]?.string ,let en_city_title = dic["en_city_title"]?.string else {
            return nil
        }
        self.id_city = id_city
        self.ar_city_title = ar_city_title
        self.en_city_title = en_city_title  
    }
    
}
