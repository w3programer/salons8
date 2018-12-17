import SwiftyJSON
class services: NSObject {
    public var id_service : String?
    public var service_title : String?
    public var categories_id_fk : String?
    public var salon_id_fk : String?
    public var service_type : String?
    public var service_details : String?
    public var home_cost : String?
    public var salon_cost : String?
    public var home_time_take : String?
    public var salon_time_take : String?
    init?(dic:[String:JSON]) {
        guard let service_title = dic["service_title"]?.string ,let id_service = dic["id_service"]?.string ,let categories_id_fk = dic["categories_id_fk"]?.string
            ,let salon_id_fk = dic["salon_id_fk"]?.string
            ,let service_type = dic["service_type"]?.string
            ,let service_details = dic["service_details"]?.string
            ,let home_cost = dic["home_cost"]?.string
            ,let salon_cost = dic["salon_cost"]?.string
            ,let home_time_take = dic["home_time_take"]?.string
            ,let salon_time_take = dic["salon_time_take"]?.string
            else {return}
        self.id_service = id_service
        self.service_title = service_title
        self.categories_id_fk =  categories_id_fk
        self.salon_id_fk  =  salon_id_fk
        self.service_type = service_type
        self.service_details = service_details
        self.home_cost = home_cost
        self.salon_cost = salon_cost
        self.home_time_take = home_time_take
        self.salon_time_take = salon_time_take
    }
}

