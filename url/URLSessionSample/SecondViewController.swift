//
//  SecondViewController.swift
//  URLSessionSample
//
//  Created by Karthik UK on 19/08/19.
//  Copyright © 2019 Manirajaa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var mainLabel: UILabel!
    var label : String?
    
    @IBAction func dissmissButton(_ sender: Any) {
      dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = label
        
        return cell
    }
    
  
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(label)
        tableView.delegate = self
        tableView.dataSource = self
    }
    


}
