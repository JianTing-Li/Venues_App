//
//  Venue.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

struct FourSquareData: Codable{
    let response: Response
}
struct Response: Codable {
    let venues: [Venue]
}
struct Venue: Codable {
    let id: String
    let name: String
    let location: Location?
    let categories: [Categories]?
}
struct Location: Codable {
    let address: String?
    let lat: Double
    let lng: Double
    let postalCode: String?
    let city: String?
    let state: String?
    let country: String?
    let formattedAddress: [String]?
}
struct Categories: Codable {
    let shortName: String
}
