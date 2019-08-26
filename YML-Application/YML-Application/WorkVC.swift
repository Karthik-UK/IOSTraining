import UIKit
class WorkVC: UIViewController {
    @IBOutlet weak var tableView :UITableView!
    var workInform : [workConstants] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        WorkUIConstants()
    }

func WorkUIConstants(){
    let theNorthFace = workConstants(workimage: "north-face-featured-1", worktitle: "THE NORTH FACE",  workdescription: "How The North Face redefined loyalty to embrace the great outdoors.",workurl: "https://ymedialabs.com/project/the-north-face")
    let clover = workConstants(workimage: "clover-featured", worktitle: "CLOVER", workdescription: "How Clover Go has become an open ecosystem for point-of-sale payments. ",workurl: "https://ymedialabs.com/project/clover")
    let credit = workConstants(workimage: "creditone-featured", worktitle:  "CREDIT ONE", workdescription: "How Credit One has become America's fastest-growing credit card issuer.",workurl: "https://ymedialabs.com/project/credit-one")
    workInform.append(theNorthFace)
    workInform.append(clover)
    workInform.append(credit)
}
}

extension WorkVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return workInform.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkCellVC", for: indexPath) as? WorkCellVC
        cell?.imageViewer.image =  UIImage(named: workInform[indexPath.row].workimage)
        cell?.titleLabel.text = workInform[indexPath.row].worktitle
        cell?.descriptionLabel.text = workInform[indexPath.row].workdescription
        return cell ?? UITableViewCell()
        }
    
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        webViewController.url = URL(string: workInform[indexPath.row].workurl)
        self.navigationController?.pushViewController(webViewController, animated: true)
       // webViewController.
    
    
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.tableView.frame.height
        }
}
//Structure for all static images,labels etc.
struct workConstants {
    let workimage :String
    let worktitle: String
    let workdescription: String
    let workurl :String
}
