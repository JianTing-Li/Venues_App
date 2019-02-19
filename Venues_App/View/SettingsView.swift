//
//  SettingsView.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    lazy var defaultLocationTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  neightborhood, city, state or zip code"
        textField.textAlignment = .center
        textField.layer.borderWidth = 5
        textField.layer.borderColor = UIColor(hexString: "#2ecc71").cgColor
        return textField
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
        setupDefaultLocationTextfield()
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
    private func setupDefaultLocationTextfield() {
        addSubview(defaultLocationTextfield)
        //defaultLocationTextfield.backgroundColor = .lightGray
        defaultLocationTextfield.translatesAutoresizingMaskIntoConstraints = false
        defaultLocationTextfield.topAnchor.constraint(equalTo: defaultVenueTypeTextfield.bottomAnchor, constant: 0).isActive = true
        defaultLocationTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        defaultLocationTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        defaultLocationTextfield.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
  
}
