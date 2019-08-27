import Foundation
import UIKit
class call{
    var viewModel = ContactVM()
    func alert(phoneURL :URL)->UIAlertController{
    let alrt = UIAlertController(title: ("Call " + viewModel.numb + "?"), message: nil, preferredStyle: .actionSheet)
    alrt.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
    UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
    }))
    alrt.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    return alrt
    }

}


