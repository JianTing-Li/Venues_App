//
//  SearchView.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

protocol SeachViewDelegate: AnyObject {
    func cellPressed(indexPath: IndexPath)
    func setupCell(indexPath: IndexPath) -> UITableViewCell
    func setupNumberOfRowsInSection() -> Int
}
protocol SearchBarDelegate: AnyObject {
    func searchButtonClicked(keyword: String)
}
protocol DefaultSearchBarDelegate: AnyObject {
    func searchButtonClicked(keyword: String)

}

class SearchView: UIView {

    weak var delegate: SeachViewDelegate?
    weak var searchDelegate: SearchBarDelegate?
    weak var defaultSearchDelegate: DefaultSearchBarDelegate?
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search Location or Place i.e. Miami or Queens"
        searchBar.sizeToFit()
        return searchBar
    }()
    
    lazy var defaultLocationSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "  Type in Venue i.e. Coffee, Bakery, Food"
        searchBar.sizeToFit()
       // searchBar.barTintColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return searchBar
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        setupSearchBar()
        setupTableView()
        setupDefaultLocationSearchBar()
        
    }
    
    private func setupSearchBar() {
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupDefaultLocationSearchBar() {
        addSubview(defaultLocationSearchBar)
        defaultLocationSearchBar.translatesAutoresizingMaskIntoConstraints = false
        defaultLocationSearchBar.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0).isActive = true
        defaultLocationSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        defaultLocationSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true

    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 50).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

extension SearchView: UISearchBarDelegate {
     func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
        if searchBar == defaultLocationSearchBar {
            guard let defaultSearchText = searchBar.text else {return}
            defaultSearchDelegate?.searchButtonClicked(keyword: defaultSearchText)
        } else {
            guard let searchText = searchBar.text else {return}
            searchDelegate?.searchButtonClicked(keyword: searchText)
        }
    }
}


extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.setupNumberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return delegate?.setupCell(indexPath: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.cellPressed(indexPath: indexPath)
    }
}
