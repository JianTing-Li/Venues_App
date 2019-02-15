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
        return title
    }()
    lazy var favoritesDescription: UITextView = {
        let body = UITextView()
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
        fatalError("init(coder:) has not been implemented")
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
        favoritesTitle.backgroundColor = .yellow
        favoritesTitle.translatesAutoresizingMaskIntoConstraints = false
        favoritesTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        favoritesTitle.topAnchor.constraint(equalTo: favoritesImage.bottomAnchor, constant: 5).isActive = true
        favoritesTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        favoritesTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        favoritesTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    private func setupDescription() {
        addSubview(favoritesDescription)
        favoritesDescription.backgroundColor = .green
        favoritesDescription.translatesAutoresizingMaskIntoConstraints = false
        favoritesDescription.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        favoritesDescription.topAnchor.constraint(equalTo: favoritesTitle.bottomAnchor, constant: 10).isActive = true
        favoritesDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        favoritesDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        //favoritesDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        favoritesDescription.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
