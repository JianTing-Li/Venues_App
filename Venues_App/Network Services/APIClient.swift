//
//  APIClient.swift
//  Venues_App
//
//  Created by Aaron Cabreja on 2/11/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

final class ApiClient {
    static func getVenue(completionHandler: @escaping (AppError?, [Venue]?) -> Void) {
        let urlString = "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&client_id=GTFB0TZVWRZNRGCB0HYEJVVXTY2BHGWO2AD44UUA2TZMXGD1&client_secret=SUGBKQVN5I5ZNAKIH10EBR3D3YTQOR2GBHBUGAC0FUGGWCLS&v=20190201"
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
