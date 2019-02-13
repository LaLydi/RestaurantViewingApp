//
//  NetworkService.swift
//  RestaurantViewingApp
//
//  Created by Lydia Marion on 2/13/19.
//  Copyright © 2019 Lydia. All rights reserved.
//

import Foundation
import Moya

private let apiKey = "t6VNKSXGtnLXYrskkohj4wAH8rsmeAuQcMd04aAtZyN2ZVJ95De0a97TX-P0AnVnejfILuhzPNdc_qIn9XQ5lPprH-G43s2S1xajDvk8xjmYiW6WFGnTYxdwUZtkXHYx"

enum YelpService {
    enum BusinessesProvider : TargetType {
        case search(lat : Double, long: Double)
        
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }
        
        var path: String {
            switch self {
            case .search:
                return "/search"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(parameters: ["latitude" : lat, "longitude" : long], encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String : String]? {
            return ["Authorization" : "Bearer \(apiKey)"]
        }
    }
}
