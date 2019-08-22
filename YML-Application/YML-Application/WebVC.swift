import UIKit
import WebKit

class WebVC: UIViewController {
    var URl: URL!
    @IBOutlet weak var webViewOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webViewOutlet.load(URLRequest(url: URl))
        
    }

}
