//
//  BaseVCViewController.swift
//  YML-Application
//
//  Created by Karthik UK on 28/08/19.
//  Copyright © 2019 Karthik UK. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
    
    func showAlert(view: UIViewController , message: String, title : String ,ok : Bool ,Error :Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        if ok == true
        {alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))}
        if Error == true
        {alert.addAction(UIAlertAction(title: "Error", style: UIAlertAction.Style.default, handler: nil))}
        view.present(alert, animated: true, completion: nil)
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
