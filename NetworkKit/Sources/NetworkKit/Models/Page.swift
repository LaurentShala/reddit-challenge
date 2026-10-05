//
//  Page.swift
//  NetworkKit
//
//  Copyright © 2026 StockX. All rights reserved.
//

import Foundation


public struct Page: Decodable, Equatable {

    /// The posts contained within the fetched page.
    public let posts: [Post]

}


// MARK: -
// MARK: Codable

extension Page {

    private enum CodingKeys: String, CodingKey {
        case hits
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        posts = try container.decode([Post].self, forKey: .hits)
    }

}
