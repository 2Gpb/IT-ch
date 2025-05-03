//
//  ITCHContacts.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

enum ITCHContacts: CaseIterable {
    case vk, telegram, email
    
    var title: String {
        switch self {
        case .vk:
            return "Вконтакте"
        case .telegram:
            return "Телеграм"
        case .email:
            return "Почта"
        }
    }
    
    var image: UIImage {
        switch self {
        case .vk:
            return ITCHImage.vk28.image
        case .telegram:
            return ITCHImage.tg28.image
        case .email:
            return ITCHImage.mail28.image
        }
    }
}
