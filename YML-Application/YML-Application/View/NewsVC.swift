import UIKit

class NewsVC: UIViewController {
    let newsModel = NewsVM()
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    @IBOutlet weak var newsTableView: UITableView!
    @IBAction func onSelect(_ sender: Any) {
        switch segmentedOutlet.selectedSegmentIndex
        {
        case 0: newsModel.getFeatured()
        case 1: newsModel.getEbooks()
        case 2: newsModel.getDesign()
        default: break
        }
        newsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.separatorColor = .black
        newsModel.getFeatured()
        //dosomething()
    }
}
