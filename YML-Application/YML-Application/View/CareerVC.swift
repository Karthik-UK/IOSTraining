import UIKit
import AVKit
import HCVimeoVideoExtractor

class CareerVC: BaseVC {
    var player:AVPlayer?
    var playButton:UIButton?
    
    @IBOutlet weak var videoView: UIView!
    var position = CareerMV()
   
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
//    override func viewDidDisappear(_ animated: Bool) {
//        dismiss(animated: true, completion: nil)
//    }
    override func viewWillAppear(_ animated: Bool) {
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoView.frame
        self.videoView.layer.addSublayer(playerLayer)
       // videoView.layer.addSublayer(playerLayer)

        player.play()
       
    
    }
    
}
    

