//
//  Data+.swift
//  ITCHUIComponents
//
//  Created by Peter on 06.04.2025.
//

import Foundation

public extension Date {
    func configure(to format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
}
