import UIKit
import MessageUI
class ContactVC: UIViewController  {
    @IBOutlet weak var titleTag: UILabel!

    @IBAction func nclick(_ sender: Any) {
        
        
        sendEmail()
        
        
    }
    @IBOutlet weak var onClickCall: UILabel!

    @IBOutlet weak var emailOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapDial = UITapGestureRecognizer(target:self, action: Selector(("actionTapped:")))
        
        let tapMail = UITapGestureRecognizer(target:self, action: Selector(("SendEmail:")))
        
        onClickCall.addGestureRecognizer(tapDial)
        emailOutlet.addGestureRecognizer(tapMail)
        
    }

    
//    @objc func showMailAlert(_ sender: UITapGestureRecognizer){
//        let emailaddress = emailOutlet.text ?? "invalid email"
//        if let mailURL = URL(string: "mailto://\(emailaddress)"){
//            let alert = UIAlertController(title: "Send mail to \(mailURL)?", message: "", preferredStyle: .actionSheet)
//
//            let sendAction = UIAlertAction(title: "Send", style: .default, handler: nil)
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//            alert.addAction(sendAction)
//            alert.addAction(cancelAction)
//            self.present(alert, animated: true, completion: nil)
//        }
    
    
    
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
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["karthik.uk@ymedialabs.com"])
            mail.setMessageBody("Enter the  mail", isHTML: true)
            present(mail, animated: true)
        } else {
            print("dgvfghfjujkuyyjkukiukujkjukkjkh")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    
    
    
}

