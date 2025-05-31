//
//  ITCHUserRoleService.swift
//  ITCHCore
//
//  Created by Peter on 04.05.2025.
//

import ITCHUtilities
import Foundation

public protocol ITCHUserRoleLogic {
    func set(for token: String)
    func get() -> ITCHUserRole?
}

public final class ITCHUserRoleService: ITCHUserRoleLogic {
    // MARK: - Constants
    enum Constant {
        static let key: String = "currentRole"
    }
    
    // MARK: - Private fields
    private let service: ITCHUserDefaultsLogic
    
    // MARK: - Lifecycle
    public init(userdefaultService: ITCHUserDefaultsLogic = ITCHUserDefaultsService()) {
        service = userdefaultService
    }
    
    // MARK: - Methods
    public func set(for token: String) {
        if let userInfo: ITCHJWTUserInfo = decodeJWT(token, as: ITCHJWTUserInfo.self) {
            service.set(value: userInfo.role, forKey: Constant.key)
        }
    }
    
    public func get() -> ITCHUserRole? {
        let role = service.get(forKey: Constant.key, defaultValue: "")
        return ITCHUserRole(rawValue: role)
    }
    
    // MARK: - Private methods
    private func decodeJWT<T: Decodable>(_ token: String, as type: T.Type) -> T? {
        let segments = token.components(separatedBy: ".")
        
        guard segments.count == 3 else {
            print("Invalid token format")
            return nil
        }

        var base64Payload = segments[1]
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        while base64Payload.count % 4 != 0 {
            base64Payload += "="
        }

        guard let payloadData = Data(base64Encoded: base64Payload) else {
            print("Failed to decode Base64")
            return nil
        }

        do {
            let decoded = try JSONDecoder().decode(T.self, from: payloadData)
            return decoded
        } catch {
            print("JSON decoding error:", error)
            return nil
        }
    }
}
