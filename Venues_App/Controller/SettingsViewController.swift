//
//  SettingsViewController.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.items?[1].image = UIImage(named: "settings")
        self.view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        title = "Settings"
        
        ApiClient.getVenuePhotos(eventID: "51eabef6498e10cf3aea7942") { (appError, eventPhotos) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let eventPhotos = eventPhotos {
                dump(eventPhotos)
            }
        }
    }
}
