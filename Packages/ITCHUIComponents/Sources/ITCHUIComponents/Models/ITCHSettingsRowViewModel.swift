//
//  ITCHSettingsModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 16.04.2025.
//

import UIKit

public struct ITCHSettingsRowViewModel {
    public var leftImage: UIImage
    public var titleText: String
    public var subtitleText: String
    public var type: ITCHSettingsRowType
    
    public init(
        leftImage: UIImage,
        titleText: String,
        subtitleText: String,
        type: ITCHSettingsRowType = .standard
    ) {
        self.leftImage = leftImage
        self.titleText = titleText
        self.subtitleText = subtitleText
        self.type = type
    }
}
