import UIKit
import Foundation
extension NewsVC : UITableViewDataSource{
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

}
