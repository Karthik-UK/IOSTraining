import UIKit

class NewsVC: UIViewController {
    var news :[News] = []
    
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    @IBOutlet weak var newsTableView: UITableView!
    
    @IBAction func onSelect(_ sender: Any) {

        switch segmentedOutlet.selectedSegmentIndex
        {
        case 0: news = News.getFeatured()
        case 1: news = News.getEbooks()
        case 2: news  = News.getDesign()
        default: break
        }
        newsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        news = News.getFeatured()
       // newsTableView.estimatedRowHeight = 100
        //newsTableView.rowHeight = UITableView.automaticDimension
    }
}


extension NewsVC : UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = newsTableView.dequeueReusableCell(withIdentifier: String(describing: Newcell.self), for: indexPath) as? Newcell
        {
        cell.imageOutlet.image = UIImage(named: news[indexPath.row].imagenews)
        cell.labelOutlet.text = news[indexPath.row].categorynews
        cell.labelExplain.text = news[indexPath.row].descriptionnews
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
       
         return UIScreen.main.bounds.height
         //return UITableView.automaticDimension
        
    }
    
    func randomclr()->UIColor{
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

}
