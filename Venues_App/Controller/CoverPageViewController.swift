//
//  CoverPageViewController.swift
//  Venues_App
//
//  Created by Kevin Waring on 2/21/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class CoverPageViewController: UIViewController {
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        setupLabel()
        setupButton()
        
        
    }
    @objc func enterButtonPressed() {
//        let tabView = SearchViewController()
        let VC = SearchViewController()
        let map = MapViewController()
        let fav = FavoritesViewController()
        let tab = UITabBarController()
        VC.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(named: "search"), tag: 0)
        map.title = "Map"
        fav.title = "Favorites"
        fav.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage(named: "bookmark"), tag: 1)
        let controller = [VC, fav]
        tab.viewControllers = controller.map{UINavigationController.init(rootViewController: $0)}
        
        present(tab, animated: true)
        
        
        
        
    }
    
    private func setupLabel() {
        self.view.addSubview(titleLabel)
        titleLabel.text = "Venyou"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 11).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -11).isActive = true
    }
    private func setupButton() {
        self.view.addSubview(enterButton)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        enterButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22).isActive = true
        enterButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true
    }
    

    

}
