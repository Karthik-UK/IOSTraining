import UIKit
import MessageUI

struct  BtnAction {
    let title: String?
    let actionType : ActionType
}

enum ActionType: Int {
    case phone
    case email
    case noAction
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
       // showAlert(message: "Mail", title: id, arrofBtns: ["Ok", "Error"], type: .alert)
        }
    
    
    
    func showAlert( message: String, title : String, arrofBtns: [BtnAction], type : UIAlertController.Style, phonenumber : String? = nil, Action :ActionType? = nil) {
    
        // title , message , btn titles , btn actions, Handling
        // title -static , message - static
        // title - general - msg - general
        // btn titles - general
        // Why we went with CustomAction instead of UIAlertAction
        // actionstype -generalised
        
        // Handling
        // Parameters for Action - yet to implement
        let alert = UIAlertController(title: title, message: message, preferredStyle: type)
        
        for button in arrofBtns {
            let customAction = CustomAction(title: button.title, style: UIAlertAction.Style.default, handler: { [weak self] (action) in
                guard let weakSelf = self else { return }
                    if let custom = action as? CustomAction {
                        weakSelf.doAction(type: custom.btnType)
                    }
                
                })
            customAction.btnType = button.actionType
            alert.addAction(customAction)
//            alert.addAction(UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: { (action) in
//
//
//                guard let number = URL(string: Action!.rawValue + phonenumber! ) else { return }
//                if UIApplication.shared.canOpenURL(number) == true{
//                UIApplication.shared.open(number)
//                }
//            }))
            
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func doAction(type: ActionType?) {
        debugPrint("Action \(type)")
        switch type! {
        case .phone:
            guard let number = URL(string: "tel://" + "34748734873487" ) else { return }
            if UIApplication.shared.canOpenURL(number) == true{
                    UIApplication.shared.open(number)
            }
        case .email:
            debugPrint("Email")
        case .noAction:
            debugPrint("No Action")
        }
    }
    
    class CustomAction : UIAlertAction {
        var btnType: ActionType?
        override init() {
            super.init()
        }
    }

}

