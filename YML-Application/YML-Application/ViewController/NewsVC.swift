import UIKit

class NewsVC: UIViewController {
    var news :[News] = []
    let newsModel = NewsViewModel()
    
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    @IBOutlet weak var newsTableView: UITableView!
    @IBAction func onSelect(_ sender: Any) {
        switch segmentedOutlet.selectedSegmentIndex
        {
        case 0: news = newsModel.getFeatured()
        case 1: news = newsModel.getEbooks()
        case 2: news  = newsModel.getDesign()
        default: break
        }
        newsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.separatorColor = .black
        news = newsModel.getFeatured()
    }
}

extension NewsVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       print(indexPath)
       return cellDeclare(withIdentifier :"Newcell",index :indexPath)
        
    }
    
    func cellDeclare(withIdentifier :String,index:IndexPath) -> UITableViewCell{
            if let cell = newsTableView.dequeueReusableCell(withIdentifier: String(describing: withIdentifier.self), for: index) as? Newcell
            {
            cell.imageOutlet.image = UIImage(named: news[index.row].imagenews)
            cell.labelOutlet.text = news[index.row].categorynews
            cell.labelExplain.text = news[index.row].descriptionnews
            cell.selectionStyle = .none
            return cell
            }
            return Newcell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let webViewController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: WebVC.self)) as? WebVC
        {
            webViewController.url = URL(string: news[indexPath.row].urlnews)
            self.navigationController?.pushViewController(webViewController, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }

}
