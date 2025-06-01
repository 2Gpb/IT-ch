//
//  ITCHSecureSessionService.swift
//  ITCHCore
//
//  Created by Peter on 31.05.2025.
//

import Foundation
import ITCHUtilities

public protocol ITCHSecureSessionLogic {
    func set(tokensModel: ITCHAccessToken)
    func get() -> ITCHAccessToken?
    func clearTokens()
}

public final class ITCHSecureSessionService: ITCHSecureSessionLogic {
    // MARK: - Constants
    enum Constant {
        static let key: String = "accessToken"
    }
    
    // MARK: - Private fields
    private let service: ITCHKeychainLogic
    private let decoder: JSONDecoder = JSONDecoder()
    private let encoder: JSONEncoder = JSONEncoder()
    
    // MARK: - Lifecycle
    public init(keychainService: ITCHKeychainLogic = ITCHKeychainService()) {
        self.service = keychainService
    }
    
    // MARK: - Methods
    public func set(tokensModel: ITCHAccessToken) {
        if let data = try? encoder.encode(tokensModel) {
            service.setData(data, forKey: Constant.key)
        }
    }
    
    public func get() -> ITCHAccessToken? {
        guard let data = service.getData(forKey: Constant.key) else {
            return nil
        }
        
        return try? decoder.decode(ITCHAccessToken.self, from: data)
    }
    
    public func clearTokens() {
        service.clearKeychain()
    }
}
