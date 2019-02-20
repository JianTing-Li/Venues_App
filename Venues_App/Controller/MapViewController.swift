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
    
    public var venues: [Venue]!
    
    
    let mapView = MapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //mapView.delegate = self
        self.view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        title = "My Map"
        view.addSubview(mapView)
        checkLocationServices()
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorized()
        } else {
            showAlert(title: "Error Message", message: "Turn on your locations, please.")
        }
    }
    
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
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorized()
    }
}
