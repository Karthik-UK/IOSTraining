//
//  DummyCell.swift
//  YML-Application
//
//  Created by Karthik UK on 23/08/19.
//  Copyright © 2019 Karthik UK. All rights reserved.
//

import UIKit

class DummyCell: UITableViewCell {

   
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
