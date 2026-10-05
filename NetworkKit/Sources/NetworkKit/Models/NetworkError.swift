//
//  NetworkError.swift
//  NetworkKit
//
//  Copyright © 2026 StockX. All rights reserved.
//

import Foundation


public enum NetworkError: Error {

    /// The URL was invalid.
    case invalidURL

    /// The response was invalid and JSON parsing failed.
    case invalidResponse

    /// An error occurred but the exact reason is unknown or unvaluable.
    case unknownError(Error?)

}
