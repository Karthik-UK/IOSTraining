import UIKit
import WebKit

class WebVC: UIViewController {
    var url: URL!
    @IBOutlet weak var webViewOutlet: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webViewOutlet.load(URLRequest(url: url))
    }

}

