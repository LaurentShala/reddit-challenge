//
//  Post.swift
//  CodingChallenge
//
//  Created by Cody Robertson on 5/20/19.
//  Copyright © 2019 Cody Robertson. All rights reserved.
//

import Foundation


struct Post: Decodable, Equatable {

    /// The title of the post.
    let title: String

    /// The author of the Hacker News story.
    let author: String

    /// The URL the post lives at.
    let url: URL?

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

    init(from decoder: Decoder) throws {
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
