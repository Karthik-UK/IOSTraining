import UIKit
extension WorkVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workTab.workInform.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableCellDeclare(index:indexPath)
        
    }
    
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let webViewController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: "WebVC")) as! WebVC
//        webViewController.url = URL(string: workTab.workInform[indexPath.row].workurl)
//        self.navigationController?.pushViewController(webViewController, animated: true)
//        
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}
