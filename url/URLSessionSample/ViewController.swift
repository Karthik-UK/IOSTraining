
import UIKit
import Foundation
import WebKit

class ViewController: UIViewController, URLSessionDelegate,URLSessionTaskDelegate, URLSessionDataDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Part1Session
        
    }
   
    
            
    
    
    
    @IBOutlet weak var textEntry: UITextField!
    
    
    struct Root: Codable {
        let results: [Result]
    }
    struct Result: Codable {
        let lexicalEntries: [Lexical]
    }
    struct Lexical: Codable {
        let entries: [Entry]
    }
    struct Entry: Codable {
        let senses: [Sense]
    }
    struct Sense: Codable {
        let definitions: [String]
    }


    @IBAction func whenPressed(_ sender: Any) {
        startload()    }
    
    
    func startload(){
    let appId = "3368cc95"
    let appKey = "16e1ca0ca3acd9e646f78be4a5279d16"
    let language = "en-gb"
    let word = textEntry.text
    let fields = "definitions"
    let strictMatch = "false"
    let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v2/entries/\(language)/\(word!.lowercased())?fields=\(fields)&strictMatch=\(strictMatch)")!
        var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue(appId, forHTTPHeaderField: "app_id")
    request.addValue(appKey, forHTTPHeaderField: "app_key")
        
    URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            //print(String(data: data, encoding: .utf8) ?? "")
        do {
            let root = try JSONDecoder().decode(Root.self, from: data)
            let results = root.results
            for result in results {
                for lexical in result.lexicalEntries {
                    for entry in lexical.entries {
                        for sense in entry.senses {
                            for definition in sense.definitions {
                                print(definition)
                                func prepare(for segue: UIStoryboardSegue, sender: Any?)
                                {
                                     if let vc = segue.destination as? SecondViewController
                                    {
                                        vc.label = definition
                                    }
                                }
                                
                                
                                
                            }
                        }
                    }
                }
            }
        } catch {
            print(error)
        }
        
        }.resume()
        
        
        
        
////    let session = URLSession.shared
////    _ = session.dataTask(with: request, completionHandler: { data, response, error in
////        if let response = response,
////            let data = data,
////            let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
////    print(response)
//    print(jsonData)
//
//    } else {
//        print(error)
//    print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue))
//    }
//    }).resume()
//
    
    
}
}
    
