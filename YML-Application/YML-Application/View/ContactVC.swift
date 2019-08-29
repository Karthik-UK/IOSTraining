import UIKit
import MapKit
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
        let appleMaps = AlertAction(title: "AppleMaps", style: .default, handler: {
            (AlertAction) in
            
        })
        showAlert(message: "Choose 1", title: " ", type: .actionSheet, Action: [appleMaps,AlertAction(title: "Googleamaps", style: .default, handler: nil)])
        
        
        if let webViewController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: "GoogleMapsVC")) as? GoogleMapsVC
        {
            webViewController.lat = contact.searchAddress.0
            webViewController.long = contact.searchAddress.1
            self.navigationController?.pushViewController(webViewController, animated: true)
        }
    }

    @objc func actionTapped(_ sender: UITapGestureRecognizer) {
        let phno = "8152024536"
        openApp(str: phno, appType: .phone)
        self.showAlert(message: "Want to Call", title: phno, type: .alert, Action: [AlertAction(title:"Cancel",style: .cancel ,handler: nil),AlertAction(title: "Call", style: .default, handler: nil)])

        }
    }

extension ContactVC{
    func openApp(str :String ,appType :AppType){
    var urlstring = str
    switch appType{
    case .phone:
        urlstring = "tel://" + urlstring

    case .email:
        print("none")
    case .noAction:
        print("none")
    }
        if let url = URL(string: str){
            if UIApplication.shared.canOpenURL(url) == true
            {UIApplication.shared.open(url)
            }}
    }
    enum AppType: Int {
        case phone
        case email
        case noAction
    }
    
}


