//
//  ITCHErrorResponse.swift
//  ITCHNetworking
//
//  Created by Peter on 24.05.2025.
//

public struct ITCHErrorResponse: Decodable, Error {
    public let status: Int
    public let error: String
    public let message: String
}
