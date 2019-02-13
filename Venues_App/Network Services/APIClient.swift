//
//  APIClient.swift
//  Venues_App
//
//  Created by Aaron Cabreja on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

final class ApiClient {

    static func getVenuePhotos(eventID: String, completionHandler: @escaping (AppError?, [EventPhoto]?) -> Void) {
        let endpointURLString = "https://api.foursquare.com/v2/venues/\(eventID)/photos?client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.ClientSecret)&v=20190208"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (error, data) in
            if let error = error {
                completionHandler(AppError.networkError(error), nil)
            } else if let data = data {
                do {
                    let eventPhotos = try JSONDecoder().decode(FourSquarePhotos.self, from: data).response.photos.items
                    guard !eventPhotos.isEmpty else {
                        print("No photos for this Venue")
                        return
                    }
                    completionHandler(nil, eventPhotos)
                } catch {
                     completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
        
    }

    static func getVenue(completionHandler: @escaping (AppError?, [Venue]?) -> Void) {
        let urlString = "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.ClientSecret)&v=20190201"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (error, data) in
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
                    let somevenues = try JSONDecoder().decode(FourSquareData.self, from: data)
                    completionHandler(nil, somevenues.response.venues)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
                    
}
