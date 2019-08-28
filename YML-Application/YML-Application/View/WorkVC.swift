import UIKit
class WorkVC: BaseVC {
    @IBOutlet weak var tableView :UITableView!
    var workTab = WorkVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        workTab.WorkUIConstants()
        tableView.separatorColor = .blue
    }
}
