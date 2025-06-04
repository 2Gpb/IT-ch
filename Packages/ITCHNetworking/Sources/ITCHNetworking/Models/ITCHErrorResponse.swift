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
    
    public init(status: Int, error: String, message: String) {
        self.status = status
        self.error = error
        self.message = message
    }
}
