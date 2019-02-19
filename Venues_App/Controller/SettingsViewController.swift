//
//  SettingsViewController.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let settingsView = SettingsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.addSubview(settingsView)
    }
}
