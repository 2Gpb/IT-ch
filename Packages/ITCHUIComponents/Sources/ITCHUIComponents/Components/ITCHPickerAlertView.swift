//
//  ITCHPickerAlertView.swift
//  ITCHUIComponents
//
//  Created by Peter on 09.05.2025.
//

import UIKit

public final class ITCHPickerAlertView {
    // MARK: - Constants
    private enum Constant {
        enum WrapView {
            static let topOffset: CGFloat = 28
            static let horizontalOffsets: CGFloat = 40
        }
        
        enum Picker {
            static let x: CGFloat = 0
            static let y: CGFloat = 0
            static let horizontalOffsets: CGFloat = 40
        }
    }
    
    // MARK: - UI Components
    private let alertController: UIAlertController = UIAlertController(
        title: nil,
        message: nil,
        preferredStyle: .actionSheet
    )
    
    private let wrapView: UIView = UIView()
    private let pickerView: UIPickerView = UIPickerView()
    
    // MARK: - Lifecycle
    public init() { }

    // MARK: - Methods
    public func configure(with model: ITCHPickerAlertViewModel) {
        alertController.title = model.title
        alertController.message = model.message
        setUpWrapView(height: model.pickerHeight)
        setUpPicker(
            delegate: model.delegate,
            dataSource: model.dataSource,
            height: model.pickerHeight,
            tag: model.tag
        )

        let confirmAction = UIAlertAction(title: model.confirmTitle, style: .default) { _ in
            model.onConfirm?()
        }

        let cancelAction = UIAlertAction(title: model.cancelTitle, style: .cancel)

        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
    }

    public func present(on viewController: UIViewController) {
        viewController.present(alertController, animated: true)
    }
    
    // MARK: - Private methods
    private func setUpWrapView(height: CGFloat) {
        alertController.view.addSubview(wrapView)
        wrapView.pinTop(to: alertController.view, Constant.WrapView.topOffset)
        wrapView.pinCenterX(to: alertController.view)
        wrapView.setWidth(UIScreen.main.bounds.width - Constant.WrapView.horizontalOffsets)
        wrapView.setHeight(height)
    }
    
    private func setUpPicker(
        delegate: UIPickerViewDelegate,
        dataSource: UIPickerViewDataSource,
        height: CGFloat,
        tag: Int
    ) {
        pickerView.frame = CGRect(
            x: Constant.Picker.x,
            y: Constant.Picker.y,
            width: UIScreen.main.bounds.width - Constant.Picker.horizontalOffsets,
            height: height
        )
        
        pickerView.dataSource = dataSource
        pickerView.delegate = delegate
        pickerView.tag = tag
        
        wrapView.addSubview(pickerView)
    }
}
