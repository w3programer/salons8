//
//  Terms.swift
//  Salonat
//
//  Created by salman on 11/4/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import SwiftyJSON
public class Terms:NSObject {
    public var title : String?
    public var content : String?
    
    init?(dic:[String:JSON]) {
        guard let title = dic["title"]?.string ,let content = dic["content"]?.string else {
            return nil
        }
        self.title = title
        self.content = content
        
        
    }
}
