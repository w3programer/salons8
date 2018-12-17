import SwiftyJSON
class reservactionsModel: NSObject {
    public var account_number : String?
    public var account_IBAN : String?
    public var account_bank_name : String?
    init?(dic:[String:JSON]) {
        guard let account_number = dic["account_number"]?.string ,let account_IBAN = dic["account_IBAN"]?.string ,let account_bank_name = dic["account_bank_name"]?.string else {return}
        self.account_IBAN = account_IBAN
        self.account_number = account_number
        self.account_bank_name = account_bank_name
    }
}
