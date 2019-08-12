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
    @IBOutlet weak var viewToChange: UIView!
    
    @IBAction func onCloseBttn(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    
    @objc func actionTapped(_ sender: UITapGestureRecognizer) {
        viewToChange.backgroundColor = randomcolour()    }
    
    
    func randomcolour()->UIColor{
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)}

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: Selector(("actionTapped:")))
        tempLabel.addGestureRecognizer(tap)
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
