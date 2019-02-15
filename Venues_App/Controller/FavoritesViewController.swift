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
    
//    var venues =  [Venue]() {
//        didSet{
//            DispatchQueue.main.async {
//                self.favoritesView.favoritesCollectionView.reloadData()
//            }
//        }
//    }
//    var photos =  [Photos]() {
//        didSet{
//            DispatchQueue.main.async {
//                self.favoritesView.favoritesCollectionView.reloadData()
//            }
//        }
//    }

//    var favoritesVenue = ApiClient.getVenue { (error, data) in
//        ApiClient.getVenue { (error, data) in
//            if let error = error {
//                print(error.errorMessage())
//            } else if let data = data {
//                self.venues = data
//            }
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        title = "My Favorites"
        view.addSubview(favoritesView)
        favoritesView.favoritesCollectionView.dataSource = self
//            ApiClient.getVenue { (error, data) in
//                if let error = error {
//                    print(error.errorMessage())
//                } else if let data = data {
//                    self.venues = data
//                }
//            }
        }
    }

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCell", for: indexPath) as? FavoritesCollectionViewCell else {return UICollectionViewCell()}
//        if let image = UIImage(data: photos[indexPath.row].) {
//        cell.favoritesImage.image = image
//    }
//    cell.favoritesTitle.text = venues[indexPath.row].name
//    cell.favoritesDescription.text = venues[indexPath.row].id
//        ApiClient.getVenuePhotos(eventID: venues[indexPath.row].id) { (error, data) in
//            if let error = error {
//                print(error.errorMessage())
//            } else if let data = data {
//                ImageHelper.fetchImageFromNetwork(urlString: "\(data.first!.prefix)original\(data.first!.suffix)", completion: { (error, data) in
//                    if let error = error {
//                        print(error.errorMessage())
//                    } else if let data = data {
//                        cell.favoritesImage.image = data
//                    }
//                })
//            }
//        }
    return cell
    
    
}
}
