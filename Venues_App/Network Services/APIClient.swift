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
        let endpointURLString = "https://api.foursquare.com/v2/venues/\(eventID)/photos?client_id=\(SecretKeys.ClientID)&client_secret=\(SecretKeys.ClientSecret)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (error, data) in
            if let error = error {
                completionHandler(AppError.networkError(error), nil)
            } else if let data = data {
                do {
                    let eventPhotos = try JSONDecoder().decode(FourSquarePhotos.self, from: data).response.items
                    completionHandler(nil, eventPhotos)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
