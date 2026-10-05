//
//  Endpoints.swift
//  NetworkKit
//
//  Copyright © 2026 StockX. All rights reserved.
//

import Foundation


public enum Endpoint {

    /// Fetches front-page stories from Hacker News.
    case home

    /// Searches Hacker News stories for the given query.
    case search(query: String)

}


// MARK: -
// MARK: Queries

extension Endpoint {

    /// The path for the specific endpoint.
    public var path: String {
        switch self {
        case .home:
            return "https://hn.algolia.com/api/v1/search?tags=front_page&hitsPerPage=25"
        case .search(let query):
            var components = URLComponents(string: "https://hn.algolia.com/api/v1/search")!
            components.queryItems = [
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "tags", value: "story"),
                URLQueryItem(name: "hitsPerPage", value: "25"),
            ]
            return components.url?.absoluteString
                ?? "https://hn.algolia.com/api/v1/search?tags=story&hitsPerPage=25"
        }
    }

    public var url: URL? {
        URL(string: path)
    }

}
