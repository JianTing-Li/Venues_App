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
    var favoritesVenue = FavoriteDataPersistenceModel.fetchAllFavoriteVenues() {
        didSet {
            DispatchQueue.main.async {
                self.favoritesView.favoritesCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        view.addSubview(favoritesView)
        favoritesView.favoritesCollectionView.dataSource = self
    }
    @objc func buttonPressed(sender: UIButton) {
        let index = sender.tag
        let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            FavoriteDataPersistenceModel.deleteFavoriteVenue(at: index)
            self.favoritesVenue = FavoriteDataPersistenceModel.fetchAllFavoriteVenues()
        }
        actionSheet.addAction(delete)
        self.present(actionSheet, animated: true, completion: nil)
    }
}
extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6 //favoritesVenue.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoritesCollectionViewCell else { return UICollectionViewCell() }
        //        if let image = UIImage(data: favoritesVenue[indexPath.row].imageData) {
        //            cell.favoritesImage.image = image
        //        }
        //        cell.favoritesTitle.text = favoritesVenue[indexPath.row].venueName
        //        cell.favoritesDescription.text = favoritesVenue[indexPath.row].date
        
        cell.minusButton.tag = indexPath.row
        cell.minusButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return cell
    }
}

