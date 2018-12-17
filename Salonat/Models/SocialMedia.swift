//
//  SocialMedia.swift
//  Salonat
//
//  Created by salman on 11/4/18.
//  Copyright © 2018 salman. All rights reserved.
//
import UIKit
import SwiftyJSON
public class SocialMedia:NSObject {
    public var facebook : String?
    public var twitter : String?
    public var instagram : String?
    public var linkedin : String?
    public var googlepluse : String?
    public var whatsapp : String?
    public var snapchat : String?
    public var phone : String?
    public var email : String?

    
    init?(dic:[String:JSON]) {
        guard let facebook = dic["facebook"]?.string ,let twitter = dic["twitter"]?.string ,let instagram = dic["instagram"]?.string,let linkedin = dic["linkedin"]?.string,let googlepluse = dic["googlepluse"]?.string,let whatsapp = dic["whatsapp"]?.string,let snapchat = dic["snapchat"]?.string,let phone = dic["phone"]?.string,let email = dic["email"]?.string else {
            return nil
        }
        self.facebook = facebook
        self.twitter = twitter
        self.instagram = instagram
        self.linkedin = linkedin
        self.googlepluse = googlepluse
        self.whatsapp = whatsapp
        self.snapchat = snapchat
        self.phone = phone
        self.email = email
        
        
        
    }
}
