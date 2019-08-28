import Foundation
import UIKit

protocol HTTPMETHODS{
    func get(urlString: String, headers: [String: String]?, successHandler: @escaping (Data) -> Void)
}
class NetworkManager: HTTPMETHODS{
    static let shared = NetworkManager()
    func check(){print("check")}
    func get(urlString: String, headers: [String : String]? = nil, successHandler: @escaping (Data) -> Void) {
        guard let url = URL(string: urlString) else { return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        if let headers = headers{
            for (k,v) in headers{
                urlRequest.addValue(v, forHTTPHeaderField: k)
            }
        }
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { [weak self] (data, response, error) in
            guard let weakSelf = self else { return }
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let response = response as? HTTPURLResponse{
                if response.statusCode >= 200 && response.statusCode < 300{
                    if let data = data{
                        successHandler(data)
                        weakSelf.check()
                    }
                    else{
                        print("Invalid Data")
                        return
                    }
                }
                else{
                    print("Invalid response")
                    return
                }
            }
        }).resume()
    }
    
   
}


