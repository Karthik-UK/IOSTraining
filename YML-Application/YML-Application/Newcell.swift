//
//  Newcell.swift
//  YML-Application
//
//  Created by Karthik UK on 23/08/19.
//  Copyright © 2019 Karthik UK. All rights reserved.
//

import UIKit

class Newcell: UITableViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var labelExplain: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
