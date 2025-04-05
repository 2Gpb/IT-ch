////
////  TextStyle.swift
////  DesignSystem-IT-ch
////
////  Created by Peter on 08.03.2025.
////
//
//import UIKit
//
////enum Font: String {
////    case regular = "SFProRounded-Regular"
////    case medium = "SFProRounded-Medium"
////    case semiBold = "SFProRounded-SemiBold"
////    case bold = "SFProRounded-Bold"
////    
////    var name: String {
////        return self.rawValue
////    }
////}
////
////struct FontDescription {
////    let font: Fontt
////    let size: CGFloat
////}
//
//enum TextStyle {
//    // MARK: - H3: 32px
//    case header3
//    
//    // MARK: - H4: 26px
//    case header4
//    
//    // MARK: - H5: 20px
//    case header5Medium
//    case header5SemiBold
//    
//    // MARK: - Body M: 16px
//    case bodyMRegular
//    case bodyMMedium
//    
//    // MARK: - Body S: 14px
//    case bodySRegular
//    case bodySMedium
//
//    // MARK: - Caption: 12px
//    case captionRegular
//    case captionMedium
//}
//
//extension TextStyle {
//    private var fontDescription: FontDescription {
//        switch self {
//        case .header3:
//            return FontDescription(font: .bold, size: 32)
//        case .header4:
//            return FontDescription(font: .medium, size: 26)
//        case .header5Medium:
//            return FontDescription(font: .medium, size: 20)
//        case .header5SemiBold:
//            return FontDescription(font: .semiBold, size: 20)
//        case .bodyMRegular:
//            return FontDescription(font: .regular, size: 16)
//        case .bodyMMedium:
//            return FontDescription(font: .medium, size: 16)
//        case .bodySRegular:
//            return FontDescription(font: .regular, size: 14)
//        case .bodySMedium:
//            return FontDescription(font: .medium, size: 14)
//        case .captionRegular:
//            return FontDescription(font: .regular, size: 12)
//        case .captionMedium:
//            return FontDescription(font: .medium, size: 12)
//        }
//    }
//}
//
//extension TextStyle {
//    var font: UIFont {
//        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size) else {
//            return UIFont()
//        }
//        
//        return font
//    }
//}
