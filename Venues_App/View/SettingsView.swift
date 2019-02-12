//
//  SettingsView.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    lazy var textField1: UITextField = {
        let textField = UITextField()
        return textField
    }()
    lazy var textField2: UITextField = {
        let textField = UITextField()
        return textField
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
        //        self.myCollectionView.register(BSCollectionViewCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        setUpViews()
    }
    private func setUpViews() {
        setupTextView()
        setupTextView2()
    }
    private func setupTextView() {
        addSubview(textField1)
        textField1.backgroundColor = .yellow
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1.topAnchor.constraint(equalTo: topAnchor, constant: 400).isActive = true
        textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        textField1.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    private func setupTextView2() {
        addSubview(textField2)
        textField2.backgroundColor = .yellow
        textField2.translatesAutoresizingMaskIntoConstraints = false
        textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 50).isActive = true
        textField2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        textField2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        textField2.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
  
}
