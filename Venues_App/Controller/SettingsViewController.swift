//
//  SettingsViewController.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit
import MapKit

class SettingsViewController: UIViewController {
    let settingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsView)
        conformToProtocols()
    }
    
    private func conformToProtocols() {
        settingsView.defaultLocationSearchBar.delegate = self
        settingsView.defaultVenueTypeTextfield.delegate = self
    }
}

extension SettingsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let locationName = searchBar.text else { return }
        LocationService.getCoordinate(addressString: locationName) { (coordinate, error) in
            if let error = error {
                print("error getting coordinate: \(error)")
            } else {
                UserDefaults.standard.set(coordinate.latitude, forKey: UserDefaultKeys.lat)
                UserDefaults.standard.set(coordinate.longitude, forKey: UserDefaultKeys.lon)
            }
        }
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let venueType = textField.text {
            UserDefaults.standard.set(venueType, forKey: UserDefaultKeys.venueType)
            return true
        } else {
            return false
        }
    }
}


