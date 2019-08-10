//
//  ThirdVC.swift
//  Appli
//
//  Created by Karthik UK on 10/08/19.
//  Copyright © 2019 Karthik UK. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.2, animations: {
            self.nameLabel.center.y += 300
        })
    }

}
