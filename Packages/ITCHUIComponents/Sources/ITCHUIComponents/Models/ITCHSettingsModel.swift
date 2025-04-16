//
//  ITCHSettingsModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 16.04.2025.
//

import UIKit

public struct ITCHSettingsModel {
    public var leftImage: UIImage
    public var titleText: String
    public var subtitleText: String
    
    public init(
        leftImage: UIImage,
        titleText: String,
        subtitleText: String
    ) {
        self.leftImage = leftImage
        self.titleText = titleText
        self.subtitleText = subtitleText
    }
}
