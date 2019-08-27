import UIKit
extension WorkVC : UITableViewDataSource{
   
    func tableCellDeclare (index:IndexPath)->WorkCellVC{
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "WorkCellVC"), for: index) as? WorkCellVC{
            cell.imageViewer.image =  UIImage(named: workTab.workInform[index.row].workimage)
            cell.titleLabel.text = workTab.workInform[index.row].worktitle
            cell.descriptionLabel.text = workTab.workInform[index.row].workdescription
            cell.selectionStyle = .none
            return cell }
        return WorkCellVC()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webViewController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: "WebVC")) as! WebVC
        webViewController.url = URL(string: workTab.workInform[indexPath.row].workurl)
        self.navigationController?.pushViewController(webViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



