//
//  UIColor+.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 08.03.2025.
//

import UIKit

public enum Color: String, CaseIterable {
    // MARK: - Base
    case base0 = "FFFFFF"
    case base5 = "F3F3F3"
    case base10 = "DDDDDD"
    case base20 = "C6C6C6"
    case base30 = "B0B0B0"
    case base40 = "9B9B9B"
    case base50 = "868686"
    case base60 = "707070"
    case base70 = "4F4F4F"
    case base80 = "3A3A3A"
    case base90 = "191919"
    
    // MARK: - Blue
    case blue5 = "F7F0FF"
    case blue10 = "E4D2FF"
    case blue20 = "CCB6FF"
    case blue30 = "B19BFF"
    case blue40 = "9282FF"
    case blue50 = "716BFF"
    case blue60 = "4E54FF"
    case blue70 = "3343EC"
    case blue80 = "2436CB"
    case blue90 = "1D289A"
    
    // MARK: - Red
    case red5 = "FFEDE7"
    case red10 = "FFC9BA"
    case red20 = "FFA590"
    case red30 = "FF806B"
    case red40 = "FF5C4C"
    case red50 = "FD3732"
    case red60 = "E1011C"
    case red70 = "C2000F"
    case red80 = "A60008"
    case red90 = "7D0003"
    
    // MARK: - Green
    case green5 = "EBF7E7"
    case green10 = "C3E7BA"
    case green20 = "9CD58F"
    case green30 = "75C369"
    case green40 = "50AF47"
    case green50 = "2A9A29"
    case green60 = "00830A"
    case green70 = "006E00"
    case green80 = "005C00"
    case green90 = "004500"
    
    // MARK: - Accent
    case backgroundDark = "0E0E10"
    case backgroundGray = "24282C"
    case tabBar = "202124"
    case cellGray = "323234"
    case cellLightGray = "3F464B"
}

public extension UIColor {
    convenience init(hex: String) {
        let chars = Array(hex)
        
        let red = Self.charToInt(chars[0]) * 16 + Self.charToInt(chars[1])
        let green = Self.charToInt(chars[2]) * 16 + Self.charToInt(chars[3])
        let blue = Self.charToInt(chars[4]) * 16 + Self.charToInt(chars[5])
        
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    private static func charToInt(_ char: Character) -> Double {
        switch char.uppercased() {
        case "A":
            return 10
        case "B":
            return 11
        case "C":
            return 12
        case "D":
            return 13
        case "E":
            return 14
        case "F":
            return 15
        default:
            guard let result = Double(String(char)) else {
                assertionFailure("could not turn hex")
                return 0
            }
            return result
        }
    }
}

public extension UIColor {
    convenience init(color: Color) {
        self.init(hex: color.rawValue)
    }
}
