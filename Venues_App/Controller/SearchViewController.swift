//
//  SearchViewController.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var venues: [Venue]!


    public var searchView = SearchView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        title = "Search"

        ApiClient.getVenue { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.venues = data
                dump(self.venues)
            }
        }

        view.addSubview(searchView)
        let MapButton = UIBarButtonItem.init(title: "Map", style: .plain, target: self, action: #selector(MapButtonPressed))
        self.navigationItem.rightBarButtonItem = MapButton

    }
    
    @objc func MapButtonPressed() {
        
    }
    
}

