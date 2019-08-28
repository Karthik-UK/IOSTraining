import UIKit
import MessageUI
import GoogleMaps
class ContactVC: BaseVC {
   
    @IBOutlet weak var titleTag: UILabel!
    @IBOutlet weak var onClickCall: UILabel!
    @IBOutlet weak var BangaloreOutlet: UILabel!
    @IBOutlet weak var reWoodOutlet: UILabel!
    var tapBangalore: UITapGestureRecognizer!
    var tapRedwood: UITapGestureRecognizer!
    var contact = ContactVM()
    @IBOutlet weak var emailOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapDial = UITapGestureRecognizer(target:self, action: Selector(("actionTapped:")))
        let tapMail = UITapGestureRecognizer(target:self, action: #selector(BaseVC.sendEmail(_:)))
        tapBangalore = UITapGestureRecognizer(target:self, action: Selector(("showLocationOnMaps:")))
        tapRedwood = UITapGestureRecognizer(target:self, action: Selector(("showLocationOnMaps:")))
        onClickCall.addGestureRecognizer(tapDial)
        emailOutlet.addGestureRecognizer(tapMail)
        BangaloreOutlet.addGestureRecognizer(tapBangalore)
        reWoodOutlet.addGestureRecognizer(tapRedwood)
       
    }

    @objc func showLocationOnMaps(_ sender: UITapGestureRecognizer){
        
        if sender == tapBangalore{
            contact.searchAddress = contact.address2
        }
        else{
            contact.searchAddress = contact.address1
        }
        if let webViewController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: "GoogleMapsVC")) as? GoogleMapsVC
        {
            webViewController.lat = contact.searchAddress.0
            webViewController.long = contact.searchAddress.1
            self.navigationController?.pushViewController(webViewController, animated: true)
        }
    }

    @objc func actionTapped(_ sender: UITapGestureRecognizer) {
        let phno = "8152024536"
        showAlert(message: phno, title: "Want to Call", arrofBtns: [BtnAction(title: "Ok", actionType: .phone) , BtnAction(title: "Cancel", actionType: .noAction)], type: .alert,phonenumber: phno,Action: .phone)

        }
    }




