//
//  ITCHUserModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 16.04.2025.
//

import UIKit

public struct ITCHUserModel {
    public var image: UIImage?
    public var name: String
    public var info: String
    
    public init(
        image: UIImage? = nil,
        name: String,
        info: String
    ) {
        self.image = image
        self.name = name
        self.info = info
    }
}
