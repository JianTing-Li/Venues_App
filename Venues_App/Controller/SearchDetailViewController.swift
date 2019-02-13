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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        title = "Events"
        view.addSubview(searchDetailView)
        let favoriteButton = UIBarButtonItem.init(title: "Favorites", style: .plain, target: self, action: #selector(FavoriteButtonPressed))
        self.navigationItem.rightBarButtonItem = favoriteButton
    }
    
    @objc func FavoriteButtonPressed() {
    }
}
