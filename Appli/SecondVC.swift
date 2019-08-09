//
//  SecondVC.swift
//  Appli
//
//  Created by Karthik UK on 09/08/19.
//  Copyright © 2019 Karthik UK. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    
   
    @IBOutlet weak var tempLabel: UILabel!
    
    
    @IBOutlet weak var view1: UIView!
    
   
    
 
    
    
    @IBAction func Button1(_ sender: Any) {
    }

    @objc func actionTapped(_ sender: UITapGestureRecognizer) {
        
        view1.backgroundColor = UIColor.black
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tempLabel?.text = "Label"
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(self.actionTapped(_:)))
        tempLabel?.isUserInteractionEnabled = true
        tempLabel?.addGestureRecognizer(tapAction)
        
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
