//
//  UserDefaultsService.swift
//  ITCHCore
//
//  Created by Peter on 19.05.2025.
//

import Foundation

public protocol ITCHUserDefaultsLogic {
    func set<T>(value: T, forKey key: String)
    func get<T>(forKey key: String, defaultValue: T) -> T
    func removeObject(for key: String)
}

public final class ITCHUserDefaultsService: ITCHUserDefaultsLogic {
    private let userDefaults: UserDefaults
    
    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    public func set<T>(value: T, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }
    
    public func get<T>(forKey key: String, defaultValue: T) -> T {
        userDefaults.object(forKey: key) as? T ?? defaultValue
    }
    
    public func removeObject(for key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
