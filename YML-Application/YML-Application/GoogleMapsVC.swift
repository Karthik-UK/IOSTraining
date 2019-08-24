
import UIKit
import GoogleMaps
class GoogleMapsVC: UIViewController {
    var lat = 3.333
    var long = 345.444
    @IBOutlet var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 4.0)
        mapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        //marker.title = "Sydney"
        //marker.snippet = "Aus"
        marker.map = mapView
        
    }
}
      //  let keyapi = ("AIzaSyBwX3H1YaNDuCH5YyrI9C3PlTV0hkRdE10")
        
        
        
//        var components = URLComponents(string: "https://maps.googleapis.com/maps/api/geocode/json")!
//        let key = URLQueryItem(name: "key", value: keyapi)
//        let address = URLQueryItem(name: "address", value: "Bangalore" )
//        components.queryItems = [key, address]
//
//        let task = URLSession.shared.dataTask(with: components.url!) { data, response, error in
//            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, error == nil else {
//                print(String(describing: response))
//                print(String(describing: error))
//                return
//            }
//
//            guard let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else {
//                print("not JSON format expected")
//                print(String(data: data, encoding: .utf8) ?? "Not string?!?")
//                return
//            }
//
//            guard let results = json["results"] as? [[String: Any]],
//                let status = json["status"] as? String,
//                status == "OK" else {
//                    print("no results")
//                    print(String(describing: json))
//                    return
//            }
//
//            DispatchQueue.main.async {
//                // now do something with the results, e.g. grab `formatted_address`:
//                //let strings = results.compactMap { $0["formatted_address"] as? String }
//                //...
//            }
//        }
//
//        task.resume()
//    }
        
        
        
        
        
        
        

    

        



