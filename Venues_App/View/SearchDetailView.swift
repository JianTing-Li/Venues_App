//
//  SearchDetailView.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class SearchDetailView: UIView {

    public lazy var eventDetailImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "pursuit-logo"))
        iv.backgroundColor = .black
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    public lazy var eventDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "HELLO IM MANNY YOUR OVERLORD!!! o_o"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.textColor = .white
        return label
    }()
    
    public lazy var eventDetailDescription: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .center
        tv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tv.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tv.text = "HELLO IM MANNY YOUR OVERLORD!!! o_o HAHA"
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
    
    private func commonInit() {
        setupImage()
        setupLabel()
        setupDescription()
        
    }
    
    private func setupImage() {
        addSubview(eventDetailImage)
        eventDetailImage.translatesAutoresizingMaskIntoConstraints = false
        eventDetailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        eventDetailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        eventDetailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        eventDetailImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -250).isActive = true
        
    }
    
    private func setupLabel() {
        addSubview(eventDetailLabel)
        eventDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        eventDetailLabel.topAnchor.constraint(equalTo: eventDetailImage.bottomAnchor, constant: 22).isActive = true
        eventDetailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        eventDetailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        
    }
    
    private func setupDescription() {
        addSubview(eventDetailDescription)
        eventDetailDescription.translatesAutoresizingMaskIntoConstraints = false
        eventDetailDescription.topAnchor.constraint(equalTo: eventDetailLabel.bottomAnchor, constant: 22).isActive = true
        eventDetailDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        eventDetailDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        eventDetailDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -22).isActive = true
    }
    
}
