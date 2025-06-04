//
//  ITCHEndpoint.swift
//  ITCHNetworking
//
//  Created by Peter on 11.02.2025.
//

import Foundation

public protocol ITCHEndpoint {
    var compositePath: String { get }
    var headers: [String: String] { get }
    var parameters: [String: String]? { get }
}

public extension ITCHEndpoint {
    var parameters: [String: String]? {
        return nil
    }
}
