//
//  ITCHFont.swift
//  ITCHUIComponents
//
//  Created by Peter on 05.04.2025.
//

import UIKit

// MARK: - Fonts names
enum Font: String {
    case regular = "SFProRounded-Regular"
    case medium = "SFProRounded-Medium"
    case semiBold = "SFProRounded-Semibold"
    case bold = "SFProRounded-Bold"
    
    var name: String {
        return self.rawValue
    }
}

struct FontDescription {
    let font: Font
    let size: CGFloat
}

public enum ITCHFont {
    // MARK: - Styles
    /// H3: 32px
    case header3
    
    /// H4: 26px
    case header4
    
    /// H5: 20px
    case header5Medium
    case header5SemiBold
    
    /// Body M: 16px
    case bodyMRegular
    case bodyMMedium
    
    /// Body S: 14px
    case bodySRegular
    case bodySMedium
    
    /// Caption: 12px
    case captionRegular
    case captionMedium
}

public extension ITCHFont {
    // MARK: - Methods
    static func registerFonts() {
        let fontNames = [
            "SFProRounded-Regular",
            "SFProRounded-Medium",
            "SFProRounded-Semibold",
            "SFProRounded-Bold"
        ]

        for fontName in fontNames {
            registerFont(named: fontName)
        }
    }

    // MARK: - Private methods
    private static func registerFont(named name: String) {
        guard
            let fontURL = Bundle.module.url(forResource: name, withExtension: "otf"),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider)
        else {
            print("Failed to load the font \(name)")
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("Font registration error \(name): \(error.debugDescription)")
        }
    }
}

// MARK: - Fonts description
extension ITCHFont {
    private var fontDescription: FontDescription {
        switch self {
        case .header3:
            return FontDescription(font: .bold, size: 32)
        case .header4:
            return FontDescription(font: .medium, size: 26)
        case .header5Medium:
            return FontDescription(font: .medium, size: 20)
        case .header5SemiBold:
            return FontDescription(font: .semiBold, size: 20)
        case .bodyMRegular:
            return FontDescription(font: .regular, size: 16)
        case .bodyMMedium:
            return FontDescription(font: .medium, size: 16)
        case .bodySRegular:
            return FontDescription(font: .regular, size: 14)
        case .bodySMedium:
            return FontDescription(font: .medium, size: 14)
        case .captionRegular:
            return FontDescription(font: .regular, size: 12)
        case .captionMedium:
            return FontDescription(font: .medium, size: 12)
        }
    }
}

public extension ITCHFont {
    var font: UIFont {
        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size) else {
            return UIFont()
        }
        
        return font
    }
}
