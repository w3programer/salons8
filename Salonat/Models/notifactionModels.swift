
import SwiftyJSON
class notifactionModel: NSObject {
    public var approved : String?
    public var approved_date : String?
    public var title : String?
    public var main_photo : String?
    init?(dic:[String:JSON]) {
        guard let approved = dic["approved"]?.string ,let approved_date = dic["approved_date"]?.string ,let title = dic["title"]?.string,let main_photo = dic["main_photo"]?.toImagePath else {return}
        self.approved = approved
        self.approved_date = approved_date
        self.title = title
        self.main_photo = main_photo

    }
}
