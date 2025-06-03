//
//  URL+.swift
//  ITCHUtilities
//
//  Created by Peter on 03.05.2025.
//

import UIKit

public extension String {
    func openURL() {
        guard let url = URL(string: self) else {
            print(self, "is't a valid URL")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

public extension String {
    func toIntArray(separator: String = ",") -> [Int] {
        return self
            .split(separator: Character(separator))
            .compactMap {
                let cleaned = $0.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                return Int(cleaned)
            }
    }
}
