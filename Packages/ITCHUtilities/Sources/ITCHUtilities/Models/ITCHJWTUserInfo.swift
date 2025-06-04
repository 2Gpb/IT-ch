//
//  ITCHJWTUserInfo.swift
//  ITCHUtilities
//
//  Created by Peter on 31.05.2025.
//

import Foundation

public struct ITCHJWTUserInfo: Codable {
    public let sub: String
    public let exp: TimeInterval
    public let role: String
}
