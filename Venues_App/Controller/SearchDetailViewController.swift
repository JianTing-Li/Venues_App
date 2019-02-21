//
//  SearchDetailViewController.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {

    private var searchDetailView = SearchDetailView()
    
    private var commentDescription = ""
    
    var thisVenue: Venue!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        title = "Events"
        view.addSubview(searchDetailView)
        searchDetailView.eventDetailLabel.text = thisVenue.name
        searchDetailView.eventDetailDescription.text = thisVenue.location?.address
        searchDetailView.eventDetailDescription.text = "\(thisVenue.location?.state), \(thisVenue.location?.city),\(thisVenue.location?.country), \(thisVenue.location?.postalCode ?? "no postal code")"
        ApiClient.getVenuePhotos(eventID: thisVenue.id) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                ImageHelper.fetchImageFromNetwork(urlString: "\(data.first!.prefix)original\(data.first!.suffix)", completion: { (error, data) in
                    if let error = error {
                        print(error.errorMessage())
                    } else if let data = data {
                        self.searchDetailView.eventDetailImage.image = data
                    }
                })
            }
        }
        let favoriteButton = UIBarButtonItem.init(title: "Favorites", style: .plain, target: self, action: #selector(FavoriteButtonPressed))
        self.navigationItem.rightBarButtonItem = favoriteButton
    }
    
    @objc func FavoriteButtonPressed() {
        let imageData = searchDetailView.eventDetailImage.image?.jpegData(compressionQuality: 0.5)
        
//         showAlert(title: "Venue Favorited 😀", message: nil)
        let alert = UIAlertController(title: "Venue Favorited", message: "Enter a text", preferredStyle: .alert)
        
        
        alert.addTextField { (textField) in
            textField.text = "Enter Comments Here"
        }
        
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0]
            print("Text field: \(textField.text)")
            self.commentDescription = textField.text ?? "no comment"
            let favoriteVenue = FavoriteVenue.init(date: Date.getISOTimestamp(), venueName: self.thisVenue.name, imageData: imageData, formattedAddress: self.thisVenue.location?.formattedAddress, comments: self.commentDescription)
            FavoriteDataPersistenceModel.addVenueToFavorite(newFavoriteVenue: favoriteVenue)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
//        let alertController = UIAlertController(title: "Venue Favorited", message: nil, preferredStyle: .alert)
//
//        alertController.addTextField(configurationHandler: {
//            (_ textField: UITextField) -> Void in
//            textField.placeholder = "Enter Comments"
//            textField.textAlignment = .center
//            textField.textColor = UIColor.blue
//
//        })
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        let okAction = UIAlertAction(title: "Ok", style: .default){ in
//            self.FavoritesView
//
//        }
        
        
    }
}

