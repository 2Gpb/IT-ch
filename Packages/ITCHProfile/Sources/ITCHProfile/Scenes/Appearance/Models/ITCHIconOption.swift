//
//  ITCHIconOption.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

enum ITCHIconOption: Int, CaseIterable {
    case primary, secondary, tertiary
    
    var title: String {
        return "ИКОНКА ПРИЛОЖЕНИЯ"
    }
    
    var image: UIImage {
        switch self {
        case .primary:
            return ITCHImage.primaryLogo60.image
        case .secondary:
            return ITCHImage.secondaryLogo60.image
        case .tertiary:
            return ITCHImage.tertiaryLogo60.image
        }
    }
    
    var appIconName: String? {
        switch self {
        case .primary:
            return nil
        case .secondary:
            return "AppIconSecondary"
        case .tertiary:
            return "AppIconTertiary"
        }
    }
}
