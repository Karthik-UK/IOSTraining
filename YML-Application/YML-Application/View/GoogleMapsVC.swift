
import UIKit
import GoogleMaps
class GoogleMapsVC: UIViewController {
    var lat = 0.0000
    var long = 0.0000
    @IBOutlet var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 7.0)
        mapView.camera = camera
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.map = mapView
        
    }
}

        
 
        
        
        
        

    

        



