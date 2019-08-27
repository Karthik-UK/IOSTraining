import UIKit
class WorkVC: UIViewController {
    @IBOutlet weak var tableView :UITableView!
    var workTab = WorkUI()
    override func viewDidLoad() {
        super.viewDidLoad()
        workTab.WorkUIConstants()
        tableView.separatorColor = .blue
    }
}
