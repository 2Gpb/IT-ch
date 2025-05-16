//
//  ITCHTextFieldModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 16.04.2025.
//

import UIKit

public struct ITCHTextFieldViewModel {
    public var title: String
    public var placeholder: String
    public var type: ITCHTextFieldType
    public var keyboardType: UIKeyboardType
    public var alignment: NSTextAlignment
    
    public init(
        title: String,
        placeholder: String,
        type: ITCHTextFieldType = .normal,
        keyboardType: UIKeyboardType = .default,
        alignment: NSTextAlignment = .left
    ) {
        self.title = title
        self.placeholder = placeholder
        self.type = type
        self.keyboardType = keyboardType
        self.alignment = alignment
    }
}
