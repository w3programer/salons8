//
//  Bank.swift
//  Salonat
//
//  Created by salman on 11/4/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import SwiftyJSON
public class Bank:NSObject {
    public var account_id : String?
    public var account_name : String?
    public var account_IBAN : String?
    public var account_bank_name : String?
    public var account_number : String?
    
    init?(dic:[String:JSON]) {
        guard let account_id = dic["account_id"]?.string ,let account_name = dic["account_name"]?.string ,let account_IBAN = dic["account_IBAN"]?.string,let account_bank_name = dic["account_bank_name"]?.string,let account_number = dic["account_number"]?.string else {
            return nil
        }
        self.account_id = account_id
        self.account_name = account_name
        self.account_IBAN = account_IBAN
        self.account_bank_name = account_bank_name
        self.account_number = account_number
        
        
    }
}
