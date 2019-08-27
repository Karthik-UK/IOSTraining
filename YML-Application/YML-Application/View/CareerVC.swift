import UIKit
import AVKit
import HCVimeoVideoExtractor

class CareerVC: UIViewController {
    var player:AVPlayer?
    var playButton:UIButton?
    
    @IBOutlet weak var videoView: UIView!
    var position = Members()
    @IBOutlet weak var careerTableView: UITableView!
    @IBAction func onClick(_ sender: Any) {
    }
   
    @IBOutlet weak var buttonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        position.loadPositionsFromJson(){ () -> Void in
            self.careerTableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        //let play = videoPlayer()
        //play.video()
            
    }
    
}
    

