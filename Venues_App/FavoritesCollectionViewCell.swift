//
//  FavoritesCollectionViewCell.swift
//  Venues_App
//
//  Created by Kevin Waring on 2/13/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    lazy var favoritesImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var favoritesTitle: UITextView = {
        let title = UITextView()
        title.text = "This is title"
        title.textAlignment = .center
        title.font = UIFont(name: "Futura", size: 15)
        return title
    }()
    lazy var favoritesDescription: UITextView = {
        let body = UITextView()
        body.text = "This is description"
        return body
    }()
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("...", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura", size: 25)
        button.setTitleColor(.black , for: .normal)
        return button
    }()
    lazy var favoritesComments: UITextView = {
        let body = UITextView()
        body.text = "Comments"
        return body
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    private func commonInit() {
        setupCells()
    }
}
extension FavoritesCollectionViewCell {
    private func setupCells() {
        setupImage()
        setupTitle()
        setupDescription()
        setupButton()
        setupComments()
    }
    private func setupImage() {
        addSubview(favoritesImage)
        favoritesImage.backgroundColor = .black
        favoritesImage.translatesAutoresizingMaskIntoConstraints = false
        favoritesImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        favoritesImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        favoritesImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        favoritesImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        
    }
    private func setupTitle() {
        addSubview(favoritesTitle)
        favoritesTitle.backgroundColor = .white
        favoritesTitle.isEditable = false
        favoritesTitle.translatesAutoresizingMaskIntoConstraints = false
        favoritesTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        favoritesTitle.topAnchor.constraint(equalTo: favoritesImage.bottomAnchor, constant: 5).isActive = true
        favoritesTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        favoritesTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        favoritesTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    private func setupDescription() {
        addSubview(favoritesDescription)
        favoritesDescription.backgroundColor = .white
        favoritesDescription.isEditable = false
        favoritesDescription.translatesAutoresizingMaskIntoConstraints = false
        favoritesDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        favoritesDescription.topAnchor.constraint(equalTo: favoritesTitle.bottomAnchor, constant: 3).isActive = true
        favoritesDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        favoritesDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        //favoritesDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        favoritesDescription.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }

    private func setupButton() {
        addSubview(minusButton)
        //minusButton.setImage(UIImage(named: "minus"), for: .normal)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        minusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
    private func setupComments() {
        addSubview(favoritesComments)
        favoritesComments.backgroundColor = .white
        favoritesComments.isEditable = false
        favoritesComments.translatesAutoresizingMaskIntoConstraints = false
        favoritesComments.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        favoritesComments.topAnchor.constraint(equalTo: favoritesDescription.bottomAnchor, constant: 3).isActive = true
        favoritesComments.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        favoritesComments.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        //favoritesDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        favoritesComments.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
