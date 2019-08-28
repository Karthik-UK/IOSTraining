import UIKit

class BaseVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert( message: String, title : String, arrofBtnTitles: [String], type : UIAlertController.Style,phoneURL : URL? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: type)

        let action = CustomAction(title: "btnTitle", style: UIAlertAction.Style.default, handler: { (action) in
           //some type
        })
        action.btnType = 1
        for btnTitle in arrofBtnTitles {
            alert.addAction(UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: { (action) in
                debugPrint(action)
                // open url
                // Open Mail
                // No Action
            }))
            
        }
        
        
//        if ok == true
//            let alertAction = UIAlertAction(title: String?, style: <#T##UIAlertAction.Style#>, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
//                alertAction.
//        {alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
//
//                }))}
//        if NO == true
//        {alert.addAction(UIAlertAction(title: "NO", style: UIAlertAction.Style.default, handler: nil))}
        self.present(alert, animated: true, completion: nil)
    }
//
//    func showAlert(message: String, title : String ,ok : Bool ,Error :Bool,type: UIAlertController.Style) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: type)
//        if ok == true
//        {alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))}
//        if Error == true
//        {alert.addAction(UIAlertAction(title: "Error", style: UIAlertAction.Style.default, handler: nil))}
//        self.present(alert, animated: true, completion: nil)
//    }
    class CustomAction : UIAlertAction {
        var btnType: Int?
        override init() {
            super.init()
        }
    }
    
    enum ActionType: Int {
        case phone
        case mail
        case noAction
    }


}
