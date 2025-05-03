//
//  URL+.swift
//  ITCHUtilities
//
//  Created by Peter on 03.05.2025.
//

import UIKit

extension String {
    public func openURL() {
        guard let url = URL(string: self) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
