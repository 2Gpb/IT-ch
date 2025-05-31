//
//  UserDefaultsService.swift
//  ITCHCore
//
//  Created by Peter on 19.05.2025.
//

import Foundation

public protocol ITCHUserDefaultsLogic {
    func set<T: Codable>(value: T, forKey key: String)
    func get<T: Decodable>(forKey key: String, defaultValue: T) -> T
    func removeObject(for key: String)
}

public final class ITCHUserDefaultsService: ITCHUserDefaultsLogic {
    private let userDefaults: UserDefaults
    
    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    public func set<T: Codable>(value: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(value) {
            userDefaults.set(data, forKey: key)
        }
    }

    public func get<T: Decodable>(forKey key: String, defaultValue: T) -> T {
        guard let data = userDefaults.object(forKey: key) as? Data else {
            return defaultValue
        }
        let decoder = JSONDecoder()
        guard let value = try? decoder.decode(T.self, from: data) else {
            return defaultValue
        }
        return value
    }
    
    public func removeObject(for key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
