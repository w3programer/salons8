import SwiftyJSON
class voteModel: NSObject {
    
    public var comment_person : String?
    public var comment_detail : String?
    public var stars_num : String?
    init?(dic:[String:JSON]) {
        guard let stars_num = dic["stars_num"]?.string ,let comment_detail = dic["comment_detail"]?.string ,let comment_person = dic["comment_person"]?.string else {return}
        self.comment_person = comment_person
        self.comment_detail = comment_detail
        self.stars_num = stars_num
}
}
