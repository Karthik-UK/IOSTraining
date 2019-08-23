import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
     var workInform : [workConstants] = []
    var colors = ["1", "2"]
    override func viewDidLoad() {
        super.viewDidLoad()
       NewsUIConstants()
    }
  
    func NewsUIConstants(){
        let theNorthFace = workConstants(workimage: "north-face-featured-1", worktitle: "THE NORTH FACE",  workdescription: "How The North Face redefined loyalty to embrace the great outdoors.",workurl: "https://ymedialabs.com/project/the-north-face")
        let clover = workConstants(workimage: "clover-featured", worktitle: "CLOVER", workdescription: "How Clover Go has become an open ecosystem for point-of-sale payments. ",workurl: "https://ymedialabs.com/project/clover")
        let credit = workConstants(workimage: "creditone-featured", worktitle:  "CREDIT ONE", workdescription: "How Credit One has become America's fastest-growing credit card issuer.",workurl: "https://ymedialabs.com/project/credit-one")
        workInform.append(theNorthFace)
        workInform.append(clover)
        workInform.append(credit)
    }

}
extension NewsVC : UITableViewDataSource,UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return colors[row]
        }
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//            self.labelText.text = colors[row]
            print(colors[row])
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workInform.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewscellVC", for: indexPath) as? NewscellVC
        cell?.imageViewOutlet.image =  UIImage(named: workInform[indexPath.row].workimage)
        cell?.labelText.text = workInform[indexPath.row].worktitle
        cell?.titleDescription.text = workInform[indexPath.row].workdescription
        
        cell?.pickerView.delegate = self
        cell?.pickerView.dataSource = self
        
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        webViewController.url = URL(string: workInform[indexPath.row].workurl)
        self.navigationController?.pushViewController(webViewController, animated: true)
        // webViewController.}
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.newsTableView.frame.height
        }

}

struct worConstants {
    let workimage :String
    let worktitle: String
    let workdescription: String
    let workurl :String
}
