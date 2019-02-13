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
    lazy var label1: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var label2: UILabel = {
        let label = UILabel()
        return label
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
        setupLabel1()
        setupLabel2()
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
    private func setupLabel1() {
        addSubview(label1)
        label1.backgroundColor = .green
        label1.translatesAutoresizingMaskIntoConstraints = false
        //label1.topAnchor.constraint(equalTo: topAnchor, constant: 300).isActive = true
        label1.bottomAnchor.constraint(equalTo: textField1.topAnchor, constant: -8).isActive = true
        label1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        label1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150).isActive = true
        label1.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
    }
    private func setupLabel2() {
        addSubview(label2)
        label2.backgroundColor = .green
        label2.translatesAutoresizingMaskIntoConstraints = false
        //label1.topAnchor.constraint(equalTo: topAnchor, constant: 300).isActive = true
        label2.bottomAnchor.constraint(equalTo: textField2.topAnchor, constant: -8).isActive = true
        label2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        label2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150).isActive = true
        label2.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
    }
  
}
