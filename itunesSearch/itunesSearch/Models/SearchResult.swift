//
//  SearchResult.swift
//  itunesSearch
//
//  Created by Bobby Keffury on 9/6/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    var title: String
    var creator: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
    }
}

struct SearchResults {
    let results: [SearchResult]
}
