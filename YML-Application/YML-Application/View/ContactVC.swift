import UIKit
import MessageUI
import GoogleMaps
class ContactVC: UIViewController  {
    @IBOutlet weak var titleTag: UILabel!
    @IBOutlet weak var onClickCall: UILabel!
    @IBOutlet weak var BangaloreOutlet: UILabel!
    @IBOutlet weak var reWoodOutlet: UILabel!
    var tapBangalore: UITapGestureRecognizer!
    var tapRedwood: UITapGestureRecognizer!
    var address = add()
    var number = phone()
    var caller = call()
    
    
    @IBOutlet weak var emailOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapDial = UITapGestureRecognizer(target:self, action: Selector(("actionTapped:")))
        let tapMail = UITapGestureRecognizer(target:self, action: Selector(("sendEmail:")))
        tapBangalore = UITapGestureRecognizer(target:self, action: Selector(("showLocationOnMaps:")))
        tapRedwood = UITapGestureRecognizer(target:self, action: Selector(("showLocationOnMaps:")))
        onClickCall.addGestureRecognizer(tapDial)
        emailOutlet.addGestureRecognizer(tapMail)
        BangaloreOutlet.addGestureRecognizer(tapBangalore)
        reWoodOutlet.addGestureRecognizer(tapRedwood)
    }

    @objc func showLocationOnMaps(_ sender: UITapGestureRecognizer){
        
        if sender == tapBangalore{
            address.searchAddress = address.address2
        }
        else{
            address.searchAddress = address.address1
        }
        if let webViewController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: "GoogleMapsVC")) as? GoogleMapsVC
        {
            webViewController.lat = address.searchAddress.0
            webViewController.long = address.searchAddress.1
            self.navigationController?.pushViewController(webViewController, animated: true)
        }
    }

    @objc func actionTapped(_ sender: UITapGestureRecognizer) {
        
        if let phoneURL = URL(string: ("tel://" + number.numb)) {
            self.present(caller.alert(phoneURL: phoneURL), animated: true, completion: nil)
            
        }
    }
    }



