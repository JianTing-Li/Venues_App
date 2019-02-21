//
//  MapViewController.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    private var locationManager = CLLocationManager()
    private var previousLocation: CLLocation?
    var directions = [MKDirections]()
    
    //private var longPress: UILongPressGestureRecognizer!
    public var venues: [Venue]!
    
    private var annotations = [MKAnnotation]()
    
    let mapView = MapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.mapView.delegate = self
        self.view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        title = "My Map"
        view.addSubview(mapView)
        checkLocationServices()
        makeAnnotations()
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorized()
        } else {
            showAlert(title: "Error Message", message: "Turn on your locations, please.")
        }
    }
    
//    private func configureLongPress() {
//        longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
//        longPress.minimumPressDuration = 0.5
//        //mapView.mapView.addGestureRecognizer(longPress)
//
//    }
//
//    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
//
//    }
    
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.requestWhenInUseAuthorization()
    
    }
    
    private func checkLocationAuthorized() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTrackingUserLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
        
    }
    
    
    private func startTrackingUserLocation() {
        mapView.mapView.showsUserLocation = true
        if let location = locationManager.location?.coordinate {
            setAndCenterRegionOnMap(coordiate: location, meters: 5000)
        }
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView.mapView)
        
        
    }
}

extension MapViewController {
    private func setAndCenterRegionOnMap(coordiate: CLLocationCoordinate2D, meters: Double) {
        let region = MKCoordinateRegion.init(center: coordiate, latitudinalMeters: meters, longitudinalMeters: meters)
        mapView.mapView.setRegion(region, animated: true)
    }
    
    private func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        return CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
    }
    
    private func makeAnnotations() {
        var venueCount = 0 {
            didSet {
                DispatchQueue.main.async {
                    self.mapView.mapView.showAnnotations(self.annotations, animated: true)
                }
            }
        }
        mapView.mapView.removeAnnotations(annotations)
        annotations.removeAll()
        for venue in venues {
            guard let address = venue.location.address else { return }
            LocationService.getCoordinate(addressString: address) { (coordinate, error) in
                if let error = error {
                    print(error)
                } else {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = coordinate
                    annotation.title = venue.name
                    self.annotations.append(annotation)
                    venueCount += 1
                }
            }
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorized()
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // TODO: need to safe unwrap coordinate
        getDirections(venueCoordinate: view.annotation!.coordinate)
    }
    
    private func getDirections(venueCoordinate: CLLocationCoordinate2D) {
        guard let userLocation = locationManager.location?.coordinate else {
            showAlert(title: "Error Message", message: "Warning we can't seem to find your location!")
            return
        }
//        let request = createDirectionsRequest(destinationCoordinate: venueCoordinate, from: userLocation)
    }
    
//    private func createDirectionsRequest(destinationCoordinate: CLLocationCoordinate2D, from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
//
//    }
    
    private func resetMapView(withNew directions: MKDirections) {
        
    }
}
