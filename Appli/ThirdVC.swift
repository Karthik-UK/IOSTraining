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
    var name1 :String = " "
    @objc func buttonClicked() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        let button:UIButton = UIButton(frame: CGRect(x: 150, y: 600, width: 100, height: 100))
        button.backgroundColor = .black
        button.setTitle("GO-BACK", for: .normal)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.layer.cornerRadius = 30
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if name1 == ""
        {
//            print("No Name Entered")
            nameLabel?.text = "PLEASE ENTER SOMETHING"
        }
        else {
               nameLabel?.text = name1
               }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, animations: {
            self.nameLabel.center.y = self.view.center.y
            
        })
    }

}

