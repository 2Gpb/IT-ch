//
//  ITCHSettingsModel.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import UIKit
import ITCHUIComponents

struct ITCHSettingsModel {
    var image: UIImage
    var title: String
    var subtitle: String
    var type: ITCHSettingsRowType
    let action: Action?

    enum Action {
        case appearance
        case language
        case about
        case contacts
        case exit
    }
}
