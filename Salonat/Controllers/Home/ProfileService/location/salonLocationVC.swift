import UIKit
import MapKit
class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}
class salonLocationVC: UIViewController {
    @IBOutlet weak var salonPlace: MKMapView!
    var locationmanager = CLLocationManager()
    var long:String?
    var lat:String?
    var salonname:String?
    var adress:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocationCoordinate2D(latitude: Double(lat!)!, longitude:Double(long!)!)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.salonPlace.setRegion(region, animated: true)
        
        let pin = customPin(pinTitle: salonname!, pinSubTitle: adress!, location: location)
        self.salonPlace.addAnnotation(pin)
        self.salonPlace.delegate = self as? MKMapViewDelegate
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named:"pin")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("annotation title == \(String(describing: view.annotation?.title!))")
    }

}
