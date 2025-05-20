//
//  Array+joinedString.swift
//  ITCHUtilities
//
//  Created by Peter on 19.05.2025.
//

public extension Array where Element == Int {
    func joinedString(separator: String = ", ") -> String {
        self.map { String($0) }.joined(separator: separator)
    }
}
