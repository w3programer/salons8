
import UIKit

class banccellVC: UITableViewCell {

    
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var iban: UILabel!
    
    @IBOutlet weak var bankNumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
