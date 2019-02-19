//
//  SearchViewController.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit
import CoreLocation

class SearchViewController: UIViewController {
public var searchView = SearchView()
    var venues =  [Venue]() {
        didSet{
            DispatchQueue.main.async {
                self.searchView.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        title = "Search"
        view.addSubview(searchView)
        searchView.delegate = self
        let MapButton = UIBarButtonItem.init(title: "Map", style: .plain, target: self, action: #selector(MapButtonPressed))
        self.navigationItem.rightBarButtonItem = MapButton
        ApiClient.getVenue { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.venues = data
            }
        }
        
    }

    @objc func MapButtonPressed() {
        
    }
    
}
extension SearchViewController: SeachViewDelegate{
    func cellPressed() {
        
    }
    
    func setupCell(indexPath: IndexPath) -> UITableViewCell {
        searchView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "VenueCell")
        let cell = searchView.tableView.dequeueReusableCell(withIdentifier: "VenueCell", for: indexPath as IndexPath)
        cell.textLabel?.text = venues[indexPath.row].name
        cell.detailTextLabel?.text = venues[indexPath.row].location.address
        ApiClient.getVenuePhotos(eventID: venues[indexPath.row].id) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                ImageHelper.fetchImageFromNetwork(urlString: "\(data.first!.prefix)original\(data.first!.suffix)", completion: { (error, data) in
                    if let error = error {
                        print(error.errorMessage())
                    } else if let data = data {
                        cell.imageView?.image = data
                    }
                })
            }
        }
        return cell
        
    }
    
    func setupNumberOfRowsInSection() -> Int {
         return venues.count
    }
    
    
}

