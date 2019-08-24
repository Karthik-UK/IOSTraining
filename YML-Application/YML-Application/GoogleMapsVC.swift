
import UIKit
import GoogleMaps
class GoogleMapsVC: UIViewController {

    @IBOutlet var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: -37.8136, longitude: 144.9631, zoom: 4.0)
        mapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Aus"
        marker.map = mapView
        
        
    }
    

        
    }


