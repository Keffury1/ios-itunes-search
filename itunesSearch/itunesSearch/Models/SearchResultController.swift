//
//  SearchResultController.swift
//  itunesSearch
//
//  Created by Bobby Keffury on 9/6/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import Foundation

class SearchResultController {
    private let baseURL = URL(string: "NEEDS URL")
    var searchResults: [SearchResult] = []
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    func performSearch(with searchTerm: String, resultType: ResultType, completion: @escaping (Error?) -> Void) {
        guard let baseURL = baseURL else {
            completion(nil)
            return
        }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "NEEDS URL", value: searchTerm)
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponents?.url else {
            print("request URL is nil")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            guard let data = data else {
                print("No data returned from data task.")
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let searchResults = try jsonDecoder.decode(SearchResult.self, from: data)
                self.searchResults = [searchResults.self]
            } catch {
                print("Unable to decode data into PersonSearch object: \(error)")
            }
            completion(nil)
            }.resume()
    }
}
