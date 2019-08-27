import UIKit

class NewsVC: UIViewController {
    
    let newsModel = NewsViewModel()
    
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
    }
}
extension NewsVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       print(indexPath)
       return cellDeclare(index :indexPath)
    }
    
    func cellDeclare(index:IndexPath) -> Newcell {
        if let cell = newsTableView.dequeueReusableCell(withIdentifier: String(describing: Newcell.self), for: index) as? Newcell {
            cell.imageOutlet.image = UIImage(named: newsModel.news[index.row].imagenews)
            cell.labelOutlet.text = newsModel.news[index.row].categorynews
            cell.labelExplain.text = newsModel.news[index.row].descriptionnews
            cell.selectionStyle = .none
            return cell
        }
        return Newcell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let webViewController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: WebVC.self)) as? WebVC
        {
            webViewController.url = URL(string: newsModel.news[indexPath.row].urlnews)
            self.navigationController?.pushViewController(webViewController, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }

}
