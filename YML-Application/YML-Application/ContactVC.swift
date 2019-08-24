import UIKit

class ContactVC: UIViewController {
    @IBOutlet weak var titleTag: UILabel!

    @IBOutlet weak var onClickCall: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target:self, action: Selector(("actionTapped:")))
        onClickCall.addGestureRecognizer(tap)
    }
    
    @objc func actionTapped(_ sender: UITapGestureRecognizer) {
        
        if let phoneURL = NSURL(string: ("tel://" + "8152024536")) {
            
            let alert = UIAlertController(title: ("Call " + "8152024536" + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}

