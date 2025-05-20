//
//  URL+.swift
//  ITCHUtilities
//
//  Created by Peter on 03.05.2025.
//

import UIKit

public extension String {
    func openURL() {
        guard let url = URL(string: self) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

public extension String {
    func toIntArray(separator: String = ",") -> [Int] {
        return self
            .split(separator: Character(separator))
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .compactMap { Int($0) }
    }
}
