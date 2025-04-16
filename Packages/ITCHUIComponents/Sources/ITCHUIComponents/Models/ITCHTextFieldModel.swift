//
//  ITCHTextFieldModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 16.04.2025.
//

public struct ITCHTextFieldModel {
    public var title: String
    public var placeholder: String
    public var type: ITCHTextFieldType
    
    public init(
        title: String,
        placeholder: String,
        type: ITCHTextFieldType = .normal
    ) {
        self.title = title
        self.placeholder = placeholder
        self.type = type
    }
}
