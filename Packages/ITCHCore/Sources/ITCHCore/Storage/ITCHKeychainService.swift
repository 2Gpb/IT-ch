//
//  ITCHKeychainLogic.swift
//  ITCHCore
//
//  Created by Peter on 31.05.2025.
//

import Security
import Foundation

public protocol ITCHKeychainLogic {
    func removeData(forKey key: String)
    func getData(forKey key: String) -> Data?
    func setData(_ data: Data, forKey key: String)
    func clearKeychain()
}

public final class ITCHKeychainService: ITCHKeychainLogic {
    // MARK: - Properties
    private var service: String

    // MARK: - Initialization
    public init(service: String? = nil) {
        if let service {
            self.service = service
        }

        self.service = Self.getAppName()
    }

    public func removeData(forKey key: String) {
        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ] as [String: Any]

        let status = SecItemDelete(query as CFDictionary)

        if status != errSecSuccess && status != errSecItemNotFound {
            print("Failed to remove data from Keychain. Status: \(status)")
        }
    }

    public func getData(forKey key: String) -> Data? {
        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true
        ] as [String: Any]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        if status == errSecSuccess {
            return result as? Data
        } else if status != errSecItemNotFound {
            print("Failed to get data from Keychain. Status: \(status)")
        }

        return nil
    }

    // MARK: - Keychain Access
    public func setData(_ data: Data, forKey key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        if status == errSecDuplicateItem {
            // If the item already exists, update it
            let updateQuery = [
                kSecClass as String: kSecClassGenericPassword as String,
                kSecAttrService as String: service,
                kSecAttrAccount as String: key
            ] as [String: Any]

            let attributesToUpdate = [
                kSecValueData as String: data
            ] as [String: Any]

            SecItemUpdate(updateQuery as CFDictionary, attributesToUpdate as CFDictionary)
        } else if status != errSecSuccess {
            print(">>> Failed to set data in Keychain. Status: \(status)")
        }
    }

    public func clearKeychain() {
        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrService as String: service
        ] as [String: Any]

        let status = SecItemDelete(query as CFDictionary)

        if status != errSecSuccess && status != errSecItemNotFound {
            print("Failed to clear Keychain. Status: \(status)")
        }
    }

    private static func getAppName() -> String {
        return "com.\((Bundle.main.infoDictionary?["CFBundleName"] as? String) ?? "").app"
    }
}
