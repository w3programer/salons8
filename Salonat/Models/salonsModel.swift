

import Foundation
import SwiftyJSON
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class salonsModel:NSObject {

    let id_salon : String?
    let title : String?
    let main_photo : String?
    let details : String?
    let address : String?
    let address_google_lat : String?
    let address_google_long : String?
    let city : String?
    let phone : String?
    let mobile : String?
    let email : String?
    var evaluation_count : String?
    let clients_count : String?
    let salon_user_id_fk : String?
    let commercial_register : String?
    let salon_stars_num : Int?
    var gallary = [JSON]()
    init?(dic:[String:JSON]) {
        guard let id_salon = dic["id_salon"]?.string ,let title = dic["title"]?.string ,let main_photo = dic["main_photo"]?.toImagePath ,let evaluation_count = dic["evaluation_count"]?.string else {
            return nil
        }
        self.id_salon = id_salon
        self.title = title
        self.main_photo = main_photo
        self.evaluation_count = (dic["evaluation_count"]?.string)!
        self.details = (dic["details"]?.string)!
        self.address = (dic["address"]?.string)!
        self.address_google_lat = (dic["address_google_lat"]?.string)!
        self.address_google_long = (dic["address_google_long"]?.string)!
        self.city = (dic["city"]?.string)!
        self.phone = (dic["phone"]?.string)!
        self.mobile = (dic["mobile"]?.string)!
        self.email = (dic["email"]?.string)!
        self.evaluation_count = evaluation_count
        self.clients_count = (dic["clients_count"]?.string)!
        self.salon_user_id_fk = (dic["salon_user_id_fk"]?.string)!
        self.commercial_register = (dic["commercial_register"]?.string)!
        self.salon_stars_num = (dic["salon_stars_num"]?.toInt)!
        self.gallary = (dic["gallary"]?.array)!
    }
}

