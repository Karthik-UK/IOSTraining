import UIKit
import AVKit
import HCVimeoVideoExtractor

class CareerVC: UIViewController {
    var player:AVPlayer?
    var playButton:UIButton?
    @IBOutlet weak var videoView: UIView!
  
    @IBOutlet weak var careerTableView: UITableView!
    struct Root: Decodable{
        let data: [Data]
    }
    
    struct Data: Decodable{
        let domain: String
        let position: String
        let location: String
    }
    
    var jsonItems: [Data] = []
    @IBAction func onClick(_ sender: Any) {
    }
   
    @IBOutlet weak var buttonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPositionsFromJson()
        
    }
    func loadPositionsFromJson(){
        guard let url = URL(string: "http://jsonstub.com/positions") else { return }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("5b87065d-b207-44fc-aa26-b9e1253720d6", forHTTPHeaderField: "JsonStub-User-Key")
        request.addValue("9a5070e8-cd53-46d4-ae0a-c25f3458c81c", forHTTPHeaderField: "JsonStub-Project-Key")
        
        let session = URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            
            if let error = error{
                print(error)
            }
            if let response = response, let data = data{
                
                do {
                    //print(String(data: data, encoding: .utf8) ?? "")
                    let root = try JSONDecoder().decode(Root.self, from: data)
                    //print(root)
                    let data = root.data
                    self.jsonItems = data
                    for item in data{
                        print(item.domain)
                        print(item.position)
                        print(item.location)
                    }
                    DispatchQueue.main.async {
                        self.careerTableView.reloadData()
                    }
                } catch {
                    print("Error : \(error)")
                }
            }
        })
        session.resume()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        guard let videoURL = URL(string: "https://vimeo.com/293855154") else {
            return
        }
    
        HCVimeoVideoExtractor.fetchVideoURLFrom(url: videoURL, completion: { ( video:HCVimeoVideo?, error:Error?) -> Void in
            if let err = error {
                print("Error = \(err.localizedDescription)")
                return
            }
            guard let vid = video else {
                print("Invalid video object")
                return
            }
            print("Title = \(vid.title), url = \(vid.videoURL), thumbnail = \(vid.thumbnailURL)")
            
            if let videoURL = vid.videoURL[.Quality540p] {
                let player = AVPlayer(url: videoURL)
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = self.videoView.frame
                self.view.layer.addSublayer(playerLayer)
                player.play()
                
            }})
    }
    
}
extension CareerVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ careerTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonItems.count
    }
    
    func tableView(_ careerTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tabcell = careerTableView.dequeueReusableCell(withIdentifier: String(describing: CareerVCCell.self), for: indexPath) as? CareerVCCell
            {
                tabcell.Label1.text = jsonItems[indexPath.row].domain
                tabcell.label2.text = jsonItems[indexPath.row].position
                tabcell.label3.text = jsonItems[indexPath.row].location
                return tabcell
            }
        return  CareerVCCell()
    }
    
    func tableView(_ careerTableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 250
    }
    
}
