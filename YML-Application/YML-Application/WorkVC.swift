import UIKit

class WorkVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{
   
    
  
    @IBOutlet weak var tableView :UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as? WorkCellVC
        //cell?.heightAnchor = UIScreen.main.bounds.size.height 
        cell?.backgroundColor = .red
        
        //cell?frame = UIScreen.main.bounds.size
        
        return cell ?? UITableViewCell()
    
    }
    
    //print(UIScreen.main.bounds.size)
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
