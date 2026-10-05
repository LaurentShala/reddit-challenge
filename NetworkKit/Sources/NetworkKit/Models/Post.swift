//
//  Post.swift
//  NetworkKit
//
//  Copyright © 2026 StockX. All rights reserved.
//

import Foundation


public struct Post: Decodable, Equatable {

    /// The title of the post.
    public let title: String

    /// The author of the Hacker News story.
    public let author: String

    /// The URL the post lives at.
    public let url: URL?

}


// MARK: -
// MARK: Decodable

extension Post {

    private enum CodingKeys: String, CodingKey {
        case title
        case author
        case url
        case objectID
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        title = try container.decode(String.self, forKey: .title)
        author = try container.decode(String.self, forKey: .author)

        if let urlString = try container.decodeIfPresent(String.self, forKey: .url),
           let remoteURL = URL(string: urlString) {
            url = remoteURL
        } else if let objectID = try container.decodeIfPresent(String.self, forKey: .objectID) {
            url = URL(string: "https://news.ycombinator.com/item?id=\(objectID)")
        } else {
            url = nil
        }
    }

}
