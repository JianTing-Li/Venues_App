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
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        tabBarController?.tabBar.barTintColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        title = "Search"
        view.addSubview(searchView)
        searchView.delegate = self
        searchView.searchDelegate = self
        let MapButton = UIBarButtonItem.init(title: "Map", style: .plain, target: self, action: #selector(MapButtonPressed))
        self.navigationItem.rightBarButtonItem = MapButton
        LocationService.getCoordinate(addressString: "New York") { (coordinate, error) in
            if let error = error{
                print("this is a\(error) type error")
            } else {
                self.getVenue(keyword:"coffee",lat: coordinate.latitude, lng: coordinate.longitude)

            }
        }
        
    }
    private func getVenue(keyword: String,lat: Double, lng: Double){
        ApiClient.getVenue(keyword: keyword, lat: lat, lng: lng) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.venues = data
            }
        }
    }
    

    @objc func MapButtonPressed() {
        let mapView = MapViewController()
        mapView.modalTransitionStyle = .flipHorizontal
        mapView.venues = self.venues
        self.navigationController?.pushViewController(mapView, animated: true)
        self.dismiss(animated: false, completion: nil)
        
    }
    
}
extension SearchViewController: SeachViewDelegate{
   
    func setupCell(indexPath: IndexPath) -> UITableViewCell {
        searchView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "VenueCell")
        var cell = searchView.tableView.dequeueReusableCell(withIdentifier: "VenueCell", for: indexPath as IndexPath)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                               reuseIdentifier: "VenueCell")
        cell.textLabel?.text = venues[indexPath.row].name
        cell.detailTextLabel?.text = venues[indexPath.row].location!.address
        return cell
        
    }
    
    func setupNumberOfRowsInSection() -> Int {
        return venues.count
    }
    
    func cellPressed(indexPath: IndexPath) {
        let venue = venues[indexPath.row]
        let detailVC = SearchDetailViewController()
        detailVC.thisVenue = venue
        navigationController?.pushViewController(detailVC, animated: true)

    }
}
extension SearchViewController: SearchBarDelegate{
    func searchButtonClicked(keyword: String) {
        LocationService.getCoordinate(addressString: keyword) { (coordinate, error) in
            if let error = error{
                print("this is a\(error) type error")
            } else {
                self.getVenue(keyword: "tacos", lat: coordinate.latitude, lng: coordinate.longitude)
                
            }
        }
    }
    
}
