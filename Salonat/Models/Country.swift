

import Foundation
 import SwiftyJSON
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Country:NSObject {
	public var id_country : String?
	public var ar_name : String?
	public var en_name : String?
	public var ar_nationality : String?
	public var en_nationality : String?
	public var phone_code : String?
	public var google_lat : String?
	public var google_long : String?

    init?(dic:[String:JSON]) {
        guard let id_country = dic["id_country"]?.string ,let ar_name = dic["ar_name"]?.string ,let en_name = dic["en_name"]?.string else {
            return nil
        }
        self.id_country = id_country
        self.ar_name = ar_name
        self.en_name = en_name
        self.ar_nationality = (dic["ar_nationality"]?.string)!
        self.en_nationality = (dic["en_nationality"]?.string)!
        self.phone_code = (dic["phone_code"]?.string)!
        self.google_lat = (dic["google_lat"]?.string)!
        self.google_long = (dic["google_long"]?.string)!

      
        
    }
}
