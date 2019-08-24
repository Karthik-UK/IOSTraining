import UIKit
import MessageUI
class ContactVC: UIViewController  {
    @IBOutlet weak var titleTag: UILabel!

  
    @IBOutlet weak var onClickCall: UILabel!

    @IBOutlet weak var emailOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapDial = UITapGestureRecognizer(target:self, action: Selector(("actionTapped:")))
        
        let tapMail = UITapGestureRecognizer(target:self, action: Selector(("sendEmail:")))
        
        onClickCall.addGestureRecognizer(tapDial)
        emailOutlet.addGestureRecognizer(tapMail)
        
    }

    
    @objc func actionTapped(_ sender: UITapGestureRecognizer) {
        
        if let phoneURL = URL(string: ("tel://" + "8152024536")) {
            
            let alert = UIAlertController(title: ("Call " + "8152024536" + "?"), message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

    }
extension ContactVC: MFMailComposeViewControllerDelegate{
    @objc func sendEmail(_ sender: UITapGestureRecognizer)
   {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["karthik.uk@ymedialabs.com"])
            mail.setMessageBody("Hi There Hello", isHTML: true)
            present(mail, animated: true)
        } else {
            print("Connect The Device")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    
    
    
}

