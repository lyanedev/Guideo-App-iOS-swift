import SwiftUI
import MapKit


enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 48.852488727649835, longitude: 2.434799988574503)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
}

class StructsMap: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // Création d'une variable qui va avoir une location initiale (ici Paris par ex) latitude/longitude
    // On choisit le zoom de la carte via MKCoordinateSpan
    @Published var mapRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    @Published var mapRegionSave = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled(){
            locationManager =  CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Avertir que la geolocalisation n'est pas activé")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Votre géolocalisation est restreinte à cause du controle parental")
        case .denied:
            print("Vous avez refusé la géolocalisation, pour le réactiver allez dans vos options")
        case .authorizedAlways, .authorizedWhenInUse:
            mapRegion = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
            mapRegionSave = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func selectPlace(position: String){
        mapRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    }
    
    func updatePos(){
        mapRegion = mapRegionSave
    }
    
}
