

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Registration {
    
	public var user_id : String?
	public var user_name : String?
	public var is_login : String?
	public var user_pass : String?
	public var user_type : String?
	public var user_full_name : String?
	public var user_phone : String?
	public var user_email : String?
	public var user_photo : String?
	public var user_token_id : String?
	public var user_google_lat : String?
	public var user_google_long : String?
	public var user_city : String?
	public var date_registration : String?
	public var user_district : String?
	public var user_address : String?
	public var user_country : String?
	public var user_nationality : String?
	public var id_country : String?
	public var ar_name : String?
	public var en_name : String?
	public var ar_city_title : String?
	public var en_city_title : String?
	public var success_signup : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Registration]
    {
        var models:[Registration] = []
        for item in array
        {
            models.append(Registration(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		user_id = dictionary["user_id"] as? String
		user_name = dictionary["user_name"] as? String
		is_login = dictionary["is_login"] as? String
		user_pass = dictionary["user_pass"] as? String
		user_type = dictionary["user_type"] as? String
		user_full_name = dictionary["user_full_name"] as? String
		user_phone = dictionary["user_phone"] as? String
		user_email = dictionary["user_email"] as? String
		user_photo = dictionary["user_photo"] as? String
		user_token_id = dictionary["user_token_id"] as? String
		user_google_lat = dictionary["user_google_lat"] as? String
		user_google_long = dictionary["user_google_long"] as? String
		user_city = dictionary["user_city"] as? String
		date_registration = dictionary["date_registration"] as? String
		user_district = dictionary["user_district"] as? String
		user_address = dictionary["user_address"] as? String
		user_country = dictionary["user_country"] as? String
		user_nationality = dictionary["user_nationality"] as? String
		id_country = dictionary["id_country"] as? String
		ar_name = dictionary["ar_name"] as? String
		en_name = dictionary["en_name"] as? String
		ar_city_title = dictionary["ar_city_title"] as? String
		en_city_title = dictionary["en_city_title"] as? String
		success_signup = dictionary["success_signup"] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.user_id, forKey: "user_id")
		dictionary.setValue(self.user_name, forKey: "user_name")
		dictionary.setValue(self.is_login, forKey: "is_login")
		dictionary.setValue(self.user_pass, forKey: "user_pass")
		dictionary.setValue(self.user_type, forKey: "user_type")
		dictionary.setValue(self.user_full_name, forKey: "user_full_name")
		dictionary.setValue(self.user_phone, forKey: "user_phone")
		dictionary.setValue(self.user_email, forKey: "user_email")
		dictionary.setValue(self.user_photo, forKey: "user_photo")
		dictionary.setValue(self.user_token_id, forKey: "user_token_id")
		dictionary.setValue(self.user_google_lat, forKey: "user_google_lat")
		dictionary.setValue(self.user_google_long, forKey: "user_google_long")
		dictionary.setValue(self.user_city, forKey: "user_city")
		dictionary.setValue(self.date_registration, forKey: "date_registration")
		dictionary.setValue(self.user_district, forKey: "user_district")
		dictionary.setValue(self.user_address, forKey: "user_address")
		dictionary.setValue(self.user_country, forKey: "user_country")
		dictionary.setValue(self.user_nationality, forKey: "user_nationality")
		dictionary.setValue(self.id_country, forKey: "id_country")
		dictionary.setValue(self.ar_name, forKey: "ar_name")
		dictionary.setValue(self.en_name, forKey: "en_name")
		dictionary.setValue(self.ar_city_title, forKey: "ar_city_title")
		dictionary.setValue(self.en_city_title, forKey: "en_city_title")
		dictionary.setValue(self.success_signup, forKey: "success_signup")

		return dictionary
	}

}
