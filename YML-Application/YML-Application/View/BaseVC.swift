import UIKit
import MessageUI

struct  AlertAction {
    var title: String?
    var style : UIAlertAction.Style
    var handler :((UIAlertAction)->Void)?
}



class BaseVC: UIViewController,MFMailComposeViewControllerDelegate{
    let id = "karthik.uk@ymedialabs.com"
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func getURL(EnteredString : String){
        if let url = URL(string: EnteredString)
         {return }
    }
    
    @objc func sendEmail(_ sender: UITapGestureRecognizer)
        {
        if MFMailComposeViewController.canSendMail() {
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients([id])
        mail.setMessageBody("Hi There Hello", isHTML: true)
        present(mail, animated: true)
        } else {
        print("Connect The Device")
        }
        }
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
            showAlert(message: "Mail", title: "To", type: .alert, Action: [AlertAction(title:"yes",style: .default ,handler: nil),AlertAction(title: "no", style: .cancel, handler: nil)])
        }

    
    
    func showAlert( message: String, title : String, type : UIAlertController.Style, Action :[AlertAction]) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: type)
        
        for item in Action {
            alert.addAction(UIAlertAction(title: item.title, style: item.style, handler: item.handler)
            )
 
        }
        self.present(alert, animated: true, completion: nil)
    }

}

