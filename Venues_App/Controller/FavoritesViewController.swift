//
//  FavoritesViewController.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    let favoritesView = FavoritesView()
    //var favoritesVenue = DataPersistenceModel.get
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        title = "My Favorites"
        view.addSubview(favoritesView)
        favoritesView.favoritesCollectionView.dataSource = self
    }
}
extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 6//favoritesVenue.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCell", for: indexPath) as? FavoritesCollectionViewCell else {return UICollectionViewCell()}
//        if let image = UIImage(data: favoritesVenue[indexPath.row].imageData)
//        cell.favoritesImage.image = image
//    }
//    cell.favoritesTitle.text = favoritesVenue[indexPath.row].name
//    cell.favoritesDescription.text = favoritesVenue[indexPath.row].address
    return cell
    
    
}
}
