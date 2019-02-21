//
//  FavoritesView.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class FavoritesView: UIView {

    lazy var favoritesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 400, height: 400)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        layout.scrollDirection = .vertical
        var cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        //cv.backgroundColor = .green
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)


        self.favoritesCollectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: "FavoriteCell")

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
        setupCollectionView()
    }
    private func setupCollectionView() {
        addSubview(favoritesCollectionView)
        favoritesCollectionView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favoritesCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        favoritesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        favoritesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        favoritesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

}
