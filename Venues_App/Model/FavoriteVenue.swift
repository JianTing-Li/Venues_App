//
//  FavVenue.swift
//  Venues_App
//
//  Created by Jian Ting Li on 2/15/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//
import Foundation

struct FavoriteVenue: Codable {
    let date: String
    let venueName: String
    let imageData: Data
    let formattedAddress: [String]
}
