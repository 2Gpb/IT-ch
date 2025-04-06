//
//  Data+.swift
//  ITCHUIComponents
//
//  Created by Peter on 06.04.2025.
//

import Foundation

public extension Date {
    func configure() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy, HH:mm"
        
        return formatter.string(from: self)
    }
}
