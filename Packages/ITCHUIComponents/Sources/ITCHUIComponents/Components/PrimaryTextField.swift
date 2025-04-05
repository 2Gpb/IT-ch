//
//  PrimaryTextField.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 12.03.2025.
//

import UIKit

extension PrimaryTextField {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum TextField {
            static let borderwidth: CGFloat = 1
            static let cornerRadius: CGFloat = 12
            static let topOffset: CGFloat = 8
            static let height: CGFloat = 48
            static let edgeViewsFrame: CGRect = CGRect(x: 0, y: 0, width: 16, height: 1)
            @MainActor static let placeholderAttributes: [NSAttributedString.Key : Any] = [
                .font: ITCHFont.bodyMRegular.font,
                .foregroundColor: UIColor(color: .base50)
            ]
        }
        
        enum View {
            static let height: CGFloat = 73
        }
    }
}

final class PrimaryTextField: UIView {
    // MARK: - UI Components
    private let label: UILabel = UILabel()
    private let textField: UITextField = UITextField()
    private let leftView: UIView = UIView(frame: Constant.TextField.edgeViewsFrame)
    private let rightView: UIView = UIView(frame: Constant.TextField.edgeViewsFrame)
    
    var onDidFinish: ((String) -> Void)?
    
    // MARK: - Lifecycle
    init(title: String, placeholder: String) {
        super.init(frame: .zero)

        label.text = title
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: Constant.TextField.placeholderAttributes
        )
        
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = .clear
        setHeight(Constant.View.height)
        
        setUpLabel()
        setUpTextField()
    }
    
    private func setUpLabel() {
        label.textColor = UIColor(color: .base60)
        label.font = ITCHFont.bodySRegular.font
        
        addSubview(label)
        label.pinTop(to: self)
        label.pinLeft(to: self)
    }
    
    private func setUpTextField() {
        textField.leftView = leftView
        textField.rightView = rightView
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.textColor = UIColor(color: .base10)
        textField.font = ITCHFont.bodyMRegular.font
        textField.layer.cornerRadius = Constant.TextField.cornerRadius
        textField.layer.borderWidth = Constant.TextField.borderwidth
        textField.layer.borderColor = UIColor(color: .cellLightGray).cgColor
        
        addSubview(textField)
        textField.pinHorizontal(to: self)
        textField.pinTop(to: label.bottomAnchor, Constant.TextField.topOffset)
        textField.setHeight(Constant.TextField.height)
    }
}
