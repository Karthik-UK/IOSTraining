import UIKit
import Foundation
extension CareerVC : UITableViewDataSource{
    func tableView(_ careerTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tabcell = careerTableView.dequeueReusableCell(withIdentifier: String(describing: CareerVCCell.self), for: indexPath) as? CareerVCCell
        {
            tabcell.Label1.text = position.jsonItems[indexPath.row].domain
            tabcell.label2.text = position.jsonItems[indexPath.row].position
            tabcell.label3.text = position.jsonItems[indexPath.row].location
            return tabcell
        }
        return  CareerVCCell()
    }

}
