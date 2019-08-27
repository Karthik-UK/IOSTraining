import UIKit
import Foundation
extension CareerVC : UITableViewDelegate{
    func tableView(_ careerTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return position.jsonItems.count
    }
    
    func tableView(_ careerTableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
}
