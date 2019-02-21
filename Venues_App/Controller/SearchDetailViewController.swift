//
//  SearchDetailViewController.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {

    public var searchDetailView = SearchDetailView()
    var thisVenue: Venue!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        title = "Events"
        view.addSubview(searchDetailView)
        searchDetailView.eventDetailLabel.text = thisVenue.name
        searchDetailView.eventDetailDescription.text = "\(thisVenue.location.state), \(thisVenue.location.city),\(thisVenue.location.country), \(thisVenue.location.postalCode ?? "no postal code")"
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
    }
}
