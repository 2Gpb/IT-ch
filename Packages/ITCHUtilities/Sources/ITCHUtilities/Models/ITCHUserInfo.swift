//
//  ITCHUserInfo.swift
//  ITCHUtilities
//
//  Created by Peter on 01.06.2025.
//

public struct ITCHUserInfo: Codable {
    public let email: String
    public let role: ITCHUserRole
    
    public init(email: String, role: ITCHUserRole) {
        self.email = email
        self.role = role
    }
}
