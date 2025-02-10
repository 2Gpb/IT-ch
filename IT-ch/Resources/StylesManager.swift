//
//  StylesManager.swift
//  IT-ch
//
//  Created by Peter on 09.02.2025.
//

import Foundation

struct Style: Decodable {
    var name: String
    var backgroundColor: String
    var cornerRadius: CGFloat?
    var textColor: String?
}

enum StyleName: String {
    case primaryButton
    case secondaryButton
}

final class StylesManager {
    static let shared: StylesManager = StylesManager()
    
    func style(for name: StyleName) -> Style? {
        guard
            let path = Bundle.main.path(forResource: "Styles", ofType: "txt"),
            let data = try? String(contentsOfFile: path, encoding: .utf8).data(using: .utf8),
            let styles = try? JSONDecoder().decode([Style].self, from: data)
        else {
            return nil
        }
        
        for style in styles where style.name == name.rawValue {
            return style
        }

        return nil
    }
}
