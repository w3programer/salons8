import SwiftyJSON
class servicesModel: NSObject {
    public var categories_id_fk : String?
    public var category_title : String?
    public var service_type : String?
    public var sub_service : [JSON]
    public var expanded:Bool?
    init?(dic:[String:JSON]) {
        guard let categories_id_fk = dic["categories_id_fk"]?.string ,let category_title = dic["category_title"]?.string ,let service_type = dic["service_type"]?.string  else {
            return nil
        }
        self.categories_id_fk = categories_id_fk
        self.category_title = category_title
        self.service_type = service_type
        self.sub_service = (dic["sub_service"]?.array)!
        self.expanded = false
    }

    
    
}
