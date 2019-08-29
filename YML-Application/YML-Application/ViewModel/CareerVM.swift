import Foundation
import AVKit
class CareerMV{
    var stat = head()
    typealias jsonHandler = (() -> Void)
    var jsonItems: [Open] = []
    func loadPositionsFromJson(_ compHandler: @escaping jsonHandler){
        NetworkManager.shared.get(urlString: stat.JsonString, headers: stat.headers, successHandler: {
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

struct head{
        let JsonString = "http://jsonstub.com/positions"
        var headers = ["Content-Type": "application/json", "JsonStub-User-Key" :"5b87065d-b207-44fc-aa26-b9e1253720d6", "JsonStub-Project-Key": "9a5070e8-cd53-46d4-ae0a-c25f3458c81c"]

    }

}


