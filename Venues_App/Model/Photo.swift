//
//  Photo.swift
//  Venues_App
//
//  Created by Manny Yusuf on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

struct FourSquarePhotos: Codable {
    let response: Photos
}

struct Photos: Codable {
    let photos: PhotoData
}

struct PhotoData: Codable {
    let count: Int
    let items: [EventPhoto]
}

struct EventPhoto: Codable {
    let id: String
    let createdAt: Int
    struct Source: Codable {
        let name: String
        let url: String
    }
    let source: Source
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
}
