import SwiftyJSON
class reservactionsModel: NSObject {
    
    public var id_reservation : String?
    public var salon_id_fk : String?
    public var reservation_sevice = [JSON]()
    public var reservation_cost : String?
    public var reservation_date_st : String?
    public var reservation_time : String?
    public var approved : String?
    public var approved_date : String?
    public var title : String?
    public var main_photo : String?
    public var address : String?
    public var phone : String?
    init?(dic:[String:JSON]) {
        
        guard let reservation_cost = dic["reservation_cost"]?.string,let reservation_sevice = dic["reservation_sevice"]?.array
            ,let title = dic["title"]?.string,let main_photo = dic["main_photo"]?.toImagePath,let phone = dic["phone"]?.string,let address = dic["address"]?.string

            else {return}
        self.id_reservation =  dic["id_reservation"]?.string
        self.salon_id_fk =  dic["salon_id_fk"]?.string
        self.reservation_sevice =  reservation_sevice
        self.reservation_cost = reservation_cost
        self.reservation_date_st =  dic["reservation_date_st"]?.string
        self.reservation_time =  dic["reservation_time"]?.string
        self.approved =  dic["approved"]?.string
        self.address =  address
        self.main_photo = main_photo
        self.phone =  phone
        self.title =  title
        self.approved =  dic["approved"]?.string
        self.approved_date =  dic["approved_date"]?.string
    }
}
