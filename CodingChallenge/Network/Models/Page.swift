//
//  Page.swift
//  CodingChallenge
//
//  Created by Cody Robertson on 5/20/19.
//  Copyright © 2019 Cody Robertson. All rights reserved.
//

import Foundation


struct Page: Decodable, Equatable {

    /// The posts contained within the fetched page.
    let posts: [Post]

}


// MARK: -
// MARK: Codable

extension Page {

    private enum CodingKeys: String, CodingKey {
        case hits
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        posts = try container.decode([Post].self, forKey: .hits)
    }

}
