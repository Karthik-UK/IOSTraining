//
//  ViewController.swift
//  Appli
//
//  Created by Karthik UK on 08/08/19.
//  Copyright © 2019 Karthik UK. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {


    @IBOutlet weak var title1: UILabel!
    var Name :String?
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var Title2: UILabel!
    @IBOutlet weak var Text1: UITextField!
    @IBOutlet weak var button2: UIButton!
    @IBAction func onClick(_ sender: Any) {
    }
    
    @IBAction func onClick2(_ sender: Any) {
        let Name = Text1.text ?? "None"
        let transitionToVC = self.storyboard?.instantiateViewController(withIdentifier: "thirdid") as! ThirdVC
        transitionToVC.name1 = Name
        transitionToVC.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(transitionToVC, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ Text1 : UITextField) -> Bool
    {
        print("Inside return")
        Text1.resignFirstResponder()
        
        return true
    }
    override func viewDidLoad() {
    super.viewDidLoad()
        
        
        image1.layer.cornerRadius = 30

        title1.center.x = self.view.frame.maxX/2
        title1.center.y = self.view.frame.maxY - self.view.frame.maxY*(6/7)


        image1.center.x = self.view.frame.maxX/2
        image1.center.y = self.view.frame.maxY - self.view.frame.maxY*(0.70)



        Title2?.center.x = self.view.frame.maxX/2
        Title2?.center.y = self.view.frame.maxY - self.view.frame.maxY*(0.55)

        Text1.center.x = self.view.frame.maxX/2
        Text1.center.y = self.view.frame.maxY -  self.view.frame.maxY*(0.45)

        buttonOutlet.center.x = self.view.frame.maxX/2
        buttonOutlet.center.y = self.view.frame.maxY - self.view.frame.maxY*(0.30)


        button2.center.x = self.view.frame.maxX/2
        button2.center.y = self.view.frame.maxY - self.view.frame.maxY*(0.20)
        
        
        
        
        //title1.translatesAutoresizingMaskIntoConstraints = false
        //title1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //title1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       // title1.widthAnchor.constraint(equalToConstant: 200).isActive = true
      //title1.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true

       //title1.heightAnchor.constraint(equalToConstant: 100).isActive = true

        //image1.translatesAutoresizingMaskIntoConstraints = false
        //image1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //image1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //image1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
       // image1.widthAnchor.constraint(equalToConstant: 150).isActive = true
       // image1.heightAnchor.constraint(equalToConstant: 200).isActive = true


        //Title2?.translatesAutoresizingMaskIntoConstraints = false
        //Title2?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //Title2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //Title2?.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
      //  Title2?.widthAnchor.constraint(equalToConstant: 80).isActive = true
      //  Title2.heightAnchor.constraint(equalToConstant: 80).isActive = true


        //Text1.translatesAutoresizingMaskIntoConstraints = false
        //Text1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //Title2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //Text1.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
       // Text1.widthAnchor.constraint(equalToConstant: 100).isActive = true
      //  Text1.heightAnchor.constraint(equalToConstant: 30).isActive = true


       // buttonOutlet.translatesAutoresizingMaskIntoConstraints = false
        //buttonOutlet.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //Title2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       // buttonOutlet.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        //buttonOutlet.widthAnchor.constraint(equalToConstant: 100).isActive = true
       // buttonOutlet.heightAnchor.constraint(equalToConstant: 100).isActive = true


        //button2.translatesAutoresizingMaskIntoConstraints = false
       // button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //Title2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       // button2.topAnchor.constraint(equalTo: view.topAnchor, constant: 650).isActive = true
       // button2.widthAnchor.constraint(equalToConstant: 100).isActive = true
      //  button2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        self.Text1.delegate = self
        
     
        
    }
    
    


}

