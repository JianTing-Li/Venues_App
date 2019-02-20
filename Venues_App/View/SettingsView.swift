//
//  SettingsView.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
//    private var locationResultsController: LocationsResultsController = {
//        let storyboard = UIStoryboard(name: "LocationResults", bundle: nil)
//        let locationController = storyboard.instantiateViewController(withIdentifier: "LocationsResultsController") as! LocationsResultsController
//        return locationController
//    }()
//    lazy var defaultLocationSearchController: UISearchController = {
//        let sc = UISearchController(searchResultsController: locationResultsController)
//        //sc.searchResultsUpdater = locationResultsController
//        sc.hidesNavigationBarDuringPresentation = false
//        sc.searchBar.placeholder = "  neightborhood, city, state or zip code"
//        sc.dimsBackgroundDuringPresentation = false
//        sc.obscuresBackgroundDuringPresentation = false
//        //definesPresentationContext = true
//        sc.searchBar.autocapitalizationType = .none
//        return sc
//    }()
    
    lazy var defaultLocationSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "  neightborhood, city, state or zip code"
        return searchBar
    }()
    
    lazy var defaultVenueTypeTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  venue type"
        textField.textAlignment = .center
        textField.layer.borderWidth = 5
        textField.layer.borderColor = UIColor(hexString: "#3498db").cgColor
        return textField
    }()
    
    lazy var locationTableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    private func commonInit(){
        backgroundColor = .white
        setUpViews()
    }
    private func setUpViews() {
        setupDefaultVenueTypeTextfield()
        setupDefaultLocationSearchBar()
        setupLocationTableView()
    }
    private func setupDefaultVenueTypeTextfield() {
        addSubview(defaultVenueTypeTextfield)
        //defaultVenueTypeTextfield.backgroundColor = .lightGray
        defaultVenueTypeTextfield.translatesAutoresizingMaskIntoConstraints = false
        defaultVenueTypeTextfield.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        defaultVenueTypeTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        defaultVenueTypeTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        defaultVenueTypeTextfield.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    private func setupDefaultLocationSearchBar() {
        addSubview(defaultLocationSearchBar)
        //defaultLocationTextfield.backgroundColor = .lightGray
        defaultLocationSearchBar.translatesAutoresizingMaskIntoConstraints = false
        defaultLocationSearchBar.topAnchor.constraint(equalTo: defaultVenueTypeTextfield.bottomAnchor, constant: 0).isActive = true
        defaultLocationSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        defaultLocationSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        defaultLocationSearchBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupLocationTableView() {
        addSubview(locationTableView)
        locationTableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "LocationCell")
        locationTableView.translatesAutoresizingMaskIntoConstraints = false
        locationTableView.topAnchor.constraint(equalTo: defaultLocationSearchBar.bottomAnchor).isActive = true
        locationTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        locationTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        locationTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

}


