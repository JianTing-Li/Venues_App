//
//  MapView.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapView: UIView {
     lazy var mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    private func commonInit(){
        backgroundColor = .white
//        self.myCollectionView.register(BSCollectionViewCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        setUpViews()
    }
    private func setUpViews() {
        
    }
    private func setupMapView() {
        
    }
  
}
