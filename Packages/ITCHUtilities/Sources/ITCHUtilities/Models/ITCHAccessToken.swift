//
//  ITCHAccessToken.swift
//  ITCHUtilities
//
//  Created by Peter on 31.05.2025.
//

public struct ITCHAccessToken: Codable {
    public let token: String
    public let refreshToken: String
    
    public init(token: String, refreshToken: String) {
        self.token = token
        self.refreshToken = refreshToken
    }
}
