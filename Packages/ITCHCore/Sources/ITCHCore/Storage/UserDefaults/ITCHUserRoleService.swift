//
//  ITCHUserRoleService.swift
//  ITCHCore
//
//  Created by Peter on 04.05.2025.
//

import ITCHUtilities
import Foundation

public final class ITCHUserRoleService {
    // MARK: - Private fields
    private let rolesKey = "rolesByUserID"
    private let userIDKey = "currentUserID"

    // MARK: - Properties
    public var currentUserID: String? {
//        UserDefaults.standard.string(forKey: userIDKey)
        "1"
    }

    public var role: ITCHUserRole? {
//        guard let id = currentUserID else { return nil }
//        return role(for: id)
        .teacher
    }
    
    // MARK: - Lifecycle
    public init() {}

    // MARK: - Private methods
    private func role(for userID: String) -> ITCHUserRole? {
        guard let rawMap = UserDefaults.standard.dictionary(forKey: rolesKey) as? [String: String],
              let rawValue = rawMap[userID],
              let role = ITCHUserRole(rawValue: rawValue) else {
            return nil
        }
        return role
    }
}
