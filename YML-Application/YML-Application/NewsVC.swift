import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    @IBOutlet weak var newsTableView: UITableView!
    @IBAction func onSelect(_ sender: Any) {
        switch segmentedOutlet.selectedSegmentIndex
        {
        case 0: print("1")
        case 1: newsTableView.backgroundColor = .red
        
        default: break
        }
    }
  
    var newsInform : [newsConstants] = []
    var typeofnews = ["featured","Technology","Design"]
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsUIConstants()
    }
  
    func NewsUIConstants(){
        let c3ai = newsConstants(newsimage: "pexels-photo-788946", newstitle: "IPHONES",  newsdescription: "The Best Phone Of 2019",newsurl: "https://ymedialabs.com/ultimate-mobile-design-trends-2018",tag :"design")
        let Creativity = newsConstants(newsimage: "creative", newstitle: "CREATIVE", newsdescription: "YML X — A Memo to Our Team and Partners",newsurl: "https://ymedialabs.com/x",tag:"tech")
        let mcd = newsConstants(newsimage: "mcdonalds-lead", newstitle: "McD", newsdescription: "We Are People: What it Means to Have a People-First Approach", newsurl: "https://ymedialabs.com/we-are-people-what-it-means-to-have-a-people-first-approach",tag: "design")
        newsInform.append(c3ai)
        newsInform.append(Creativity)
        newsInform.append(mcd)
       
    }

}
extension NewsVC : UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsInform.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "Newcell", for: indexPath) as! Newcell
        cell.imageOutlet.image = UIImage(named: newsInform[indexPath.row].newsimage)
        cell.labelOutlet.text = newsInform[indexPath.row].newstitle
        cell.labelExplain.text = newsInform[indexPath.row].newsdescription
        //cell?.backgroundColor = randomclr()
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        webViewController.url = URL(string: newsInform[indexPath.row].newsurl)
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return  450//self.newsTableView.frame.height
        }

    
    func randomclr()->UIColor{
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
}

struct newsConstants {
    let newsimage :String
    let newstitle: String
    let newsdescription: String
    let newsurl :String
    let tag :String
 
}
