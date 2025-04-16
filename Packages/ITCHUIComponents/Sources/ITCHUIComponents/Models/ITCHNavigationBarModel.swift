//
//  ITCHNavigationBarModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 15.04.2025.
//

import UIKit

public struct ITCHNavigationBarModel {
    public var title: String
    public var leftImage: UIImage?
    public var rightImage: UIImage?
    
    public init(
        title: String,
        leftImage: UIImage? = nil,
        rightImage: UIImage? = nil
    ) {
        self.title = title
        self.leftImage = leftImage
        self.rightImage = rightImage
    }
}
