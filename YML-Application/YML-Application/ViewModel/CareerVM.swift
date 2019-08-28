import Foundation
import HCVimeoVideoExtractor
import AVKit

class CareerMV{
    
    typealias jsonHandler = (() -> Void)
    var jsonItems: [Opening] = []
    
    let JsonString = "http://jsonstub.com/positions"
    let userKey = "5b87065d-b207-44fc-aa26-b9e1253720d6"
    let ProjectKey = "9a5070e8-cd53-46d4-ae0a-c25f3458c81c"
  
   
    func loadPositionsFromJson(_ compHandler: @escaping jsonHandler){
        
        var headers = ["Content-Type": "application/json", "JsonStub-User-Key" : userKey, "JsonStub-Project-Key": ProjectKey]
        NetworkManager.shared.get(urlString: JsonString, headers: headers, successHandler: {
            [self] (data) in
            do{
                let root = try JSONDecoder().decode(Root.self, from: data)
                print(root)
                let data = root.data
                self.jsonItems = data
                for item in data{
                    print(item.domain)
                    print(item.position)
                    print(item.location)
                }
                DispatchQueue.main.async {
                    compHandler()
                }
            }
            catch{
                print("Error")
            }
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//    var jsonItems: [Data] = []
//    func loadPositionsFromJson(_ compHandler: @escaping jsonHandler){
//        guard let url = URL(string: JsonString ) else { return }
//        var request = URLRequest(url: url)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue(userKey, forHTTPHeaderField: "JsonStub-User-Key")
//        request.addValue(ProjectKey, forHTTPHeaderField: "JsonStub-Project-Key")
//
//        let session = URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
//
//            if let error = error{
//            print(error)
//            }
//            if let response = response, let data = data{
//
//                do {
//                    let root = try JSONDecoder().decode(Root.self, from: data)
//                    let data = root.data
//                    self.jsonItems = data
//                    for item in data{
//                        print(item.domain)
//                        print(item.position)
//                        print(item.location)
//                }
//                DispatchQueue.main.async {
//                    compHandler()
//                }
//            } catch {
//                print("Error : \(error)")
//            }
//        }
//    })
//    session.resume()
//}


class videoPlayer{
    var  career = CareerVC()
    typealias videoHandler = ((URL) -> Void)
    func video(_ completionHandler: @escaping videoHandler){
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
          //  playerLayer.frame = self.career.videoView.frame
           // self.career.view.layer.addSublayer(playerLayer)
            player.play()
            }
        })
    }
}
    
    

}
