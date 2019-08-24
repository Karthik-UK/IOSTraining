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
    var address1 = (37.524950,-122.258507)
    var address2 = (12.9715, 77.5945)
    //var keyapi = "AIzaSyBwX3H1YaNDuCH5YyrI9C3PlTV0hkRdE10"
    
    
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
        var searchAddress = (0.0, 0.0)
        if sender == tapBangalore{
            searchAddress = address2
        }
        else{
            searchAddress = address1
        }
        
        
        if let webViewController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: "GoogleMapsVC")) as? GoogleMapsVC
        {
            webViewController.lat = searchAddress.0
            webViewController.long = searchAddress.1
            self.navigationController?.pushViewController(webViewController, animated: true)
        }
        
    }
        
        
        
        
        
        
        //print(searchAddress)
//        var components = URLComponents(string: "https://maps.googleapis.com/maps/api/geocode/json")!
//        let key = URLQueryItem(name: "key", value: keyapi)
//        let address = URLQueryItem(name: "address", value: searchAddress )
//        components.queryItems = [key, address]
//
//        let task = URLSession.shared.dataTask(with: components.url!) { data, response, error in
//            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, error == nil else {
//                print(String(describing: response))
//                print(String(describing: error))
//                return
//        }
//
//        guard let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else {
//            print("not JSON format expected")
//            print(String(data: data, encoding: .utf8) ?? "Not string?!?")
//            return
//        }
//
//        guard let results = json["results"] as? [[String: Any]],
//            let status = json["status"] as? String,
//            status == "OK" else {
//                print("no results")
//                print(String(describing: json))
//                return
//        }
//
//        DispatchQueue.main.async {
//            // now do something with the results, e.g. grab `formatted_address`:
//            //let strings = results.compactMap { $0["formatted_address"] as? String }
//            //...
//        }
//    }
//
//    task.resume()
//
//    }
    
    
    

    func actionTapped(_ sender: UITapGestureRecognizer) {
        
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


