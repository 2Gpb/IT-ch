//
//  ITCHTokenResponse.swift
//  ITCHNetworking
//
//  Created by Peter on 31.05.2025.
//

public struct ITCHTokenResponse: Codable {
    public let token: String
    public let refreshToken: String
}
