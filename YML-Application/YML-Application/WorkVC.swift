import UIKit

class WorkVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{
   
    
  
    @IBOutlet weak var tableView :UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkCellVC", for: indexPath) as? WorkCellVC
        cell?.backgroundColor = .red
        return cell ?? UITableViewCell()
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.tableView.frame.height
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
