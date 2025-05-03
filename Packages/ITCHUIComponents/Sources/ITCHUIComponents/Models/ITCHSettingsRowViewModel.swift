//
//  ITCHSettingsModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 16.04.2025.
//

import UIKit

public struct ITCHSettingsRowViewModel {
    public var leftImage: UIImage
    public var title: String
    public var subtitle: String
    public var type: ITCHSettingsRowType
    
    public init(
        leftImage: UIImage,
        title: String,
        subtitle: String,
        type: ITCHSettingsRowType = .standard
    ) {
        self.leftImage = leftImage
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}
