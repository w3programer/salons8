
import SwiftyJSON
class subservicesModel: NSObject {
    public var categories_id_fk : String?
    public var id_service : String?
    public var service_title : String?
    public var salon_cost : String?
    public var home_cost : String?
    public var home_time_take : String?
    public var salon_time_take : String?
    public var service_details : String?
    public var service_type : String?
    init?(dic:[String:JSON]) {
        guard let categories_id_fk = dic["categories_id_fk"]?.string ,let service_title = dic["service_title"]?.string  else {
            return nil
        }
        self.categories_id_fk = categories_id_fk
        self.service_title = service_title
        self.salon_cost = dic["salon_cost"]?.string
        self.home_cost = dic["home_cost"]?.string
        self.home_time_take = dic["home_time_take"]?.string
        self.salon_time_take = dic["salon_time_take"]?.string
        self.service_details = dic["service_details"]?.string
        self.service_type = dic["service_type"]?.string

        
        
        
        
    }
    
    
    
}
