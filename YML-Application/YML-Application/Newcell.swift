import UIKit

class Newcell: UITableViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var labelExplain: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
