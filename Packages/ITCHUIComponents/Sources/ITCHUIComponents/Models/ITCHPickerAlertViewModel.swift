//
//  ITCHPickerAlertViewModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 09.05.2025.
//

import UIKit
import Foundation

public struct ITCHPickerAlertViewModel {
    public var title: String
    public var message: String
    public var delegate: UIPickerViewDelegate
    public var dataSource: UIPickerViewDataSource
    public var pickerHeight: CGFloat
    public var confirmTitle: String
    public var cancelTitle: String
    public var tag: Int
    public var onConfirm: (() -> Void)?
    
    public init(
        title: String,
        message: String = "\n\n\n\n\n\n\n\n\n\n",
        delegate: UIPickerViewDelegate,
        dataSource: UIPickerViewDataSource,
        pickerHeight: CGFloat = 220,
        confirmTitle: String = "Выбрать",
        cancelTitle: String = "Отмена",
        tag: Int = 0,
        onConfirm: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.delegate = delegate
        self.dataSource = dataSource
        self.pickerHeight = pickerHeight
        self.confirmTitle = confirmTitle
        self.cancelTitle = cancelTitle
        self.tag = tag
        self.onConfirm = onConfirm
    }
}
