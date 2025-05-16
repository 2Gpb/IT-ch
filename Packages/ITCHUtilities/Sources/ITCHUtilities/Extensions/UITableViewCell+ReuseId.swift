//
//  UITableViewCell+ReuseId.swift
//  ITCHUtilities
//
//  Created by Peter on 13.05.2025.
//

import UIKit

public protocol Reusable {
    static var reuseId: String { get }
}

public extension Reusable {
    static var reuseId: String {
        return String(describing: Self.self)
    }
}

extension UITableViewCell: Reusable {}
