import Foundation
import UIKit
import MessageUI
extension BaseVC: MFMailComposeViewControllerDelegate{
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
        showAlert(message: "Mail", title: "djvdkjfnvfkvnfdvnfvn", arrofBtnTitles: ["Ok", "Error"], type: .alert)
    }
    
}
