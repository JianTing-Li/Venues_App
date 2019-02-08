//
//  Date+Extensions.swift
//  Venues_App
//
//  Created by Jian Ting Li on 2/8/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

extension Date {
    // get an ISO timestamp (current date)
    // e.g., let timestamp = Date().getISOTimestamp()
    static func getISOTimestamp() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        let timestamp = isoDateFormatter.string(from: Date())
        return timestamp
    }
}
