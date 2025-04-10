//
//  PrimaryTextField.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 12.03.2025.
//

import UIKit

public final class ITCHTextField: UIView {
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
            @MainActor static let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .font: ITCHFont.bodyMRegular.font,
                .foregroundColor: ITCHColor.base50.color
            ]
        }
        
        enum View {
            static let height: CGFloat = 73
        }
    }

    // MARK: - UI Components
    private let label: UILabel = UILabel()
    private let textField: UITextField = UITextField()
    private let leftView: UIView = UIView(frame: Constant.TextField.edgeViewsFrame)
    private let rightView: UIView = UIView(frame: Constant.TextField.edgeViewsFrame)
    private let eyeButton: ITCHCustomButton = ITCHCustomButton()
    private let eyeOffButton: ITCHCustomButton = ITCHCustomButton()
    
    // MARK: - Properties
    public var returnAction: (() -> Void)?
    public var isError: Bool = false {
        didSet {
            updateErrorState()
        }
    }
    
    public var keyboardState: ITCHKeyboardState = .close {
        didSet {
            setKeyboard()
        }
    }
    
    // MARK: - Lifecycle
    public init(
        title: String,
        placeholder: String,
        type: ITCHTextFieldType = .normal
    ) {
        super.init(frame: .zero)
        
        setUp(
            title: title,
            placeholder: placeholder,
            type: type
        )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(
        title: String,
        placeholder: String,
        type: ITCHTextFieldType
    ) {
        label.text = title
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: Constant.TextField.placeholderAttributes
        )
        
        backgroundColor = .clear
        setHeight(Constant.View.height)
        
        setUpLabel()
        setUpTextField()
        
        if type == .password {
            setUpHideShowButton()
        }
    }
    
    private func setUpLabel() {
        label.textColor = ITCHColor.base60.color
        label.font = ITCHFont.bodySRegular.font
        
        addSubview(label)
        label.pinTop(to: self)
        label.pinLeft(to: self)
    }
    
    private func setUpTextField() {
        textField.delegate = self
        textField.leftView = leftView
        textField.rightView = rightView
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.textColor = ITCHColor.base10.color
        textField.font = ITCHFont.bodyMRegular.font
        textField.layer.cornerRadius = Constant.TextField.cornerRadius
        textField.layer.borderWidth = Constant.TextField.borderwidth
        textField.layer.borderColor = ITCHColor.cellLightGray.color.cgColor
        
        addSubview(textField)
        textField.pinHorizontal(to: self)
        textField.pinTop(to: label.bottomAnchor, Constant.TextField.topOffset)
        textField.setHeight(Constant.TextField.height)
    }
    
    private func setUpHideShowButton() {
        eyeButton.setImage(ITCHImage.eye20.image, for: .normal)
        eyeOffButton.setImage(ITCHImage.eyeOff20.image, for: .normal)
        eyeOffButton.isHidden = true
        
        [eyeButton, eyeOffButton].forEach { button in
            button.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
            
            addSubview(button)
            button.pinCenterY(to: textField)
            button.pinRight(to: textField, 16)
        }
    }
    
    // MARK: - Private methods
    private func updateErrorState() {
        if isError {
            textField.layer.borderColor = ITCHColor.red60.color.cgColor
        } else {
            textField.layer.borderColor = ITCHColor.cellLightGray.color.cgColor
        }
    }
    
    private func setKeyboard() {
        switch keyboardState {
        case .open:
            textField.becomeFirstResponder()
        case .close:
            textField.resignFirstResponder()
        }
    }
    
    // MARK: - Actions
    @objc
    private func eyeButtonTapped() {
        if eyeOffButton.isHidden {
            eyeOffButton.isHidden = false
            eyeButton.isHidden = true
            
            textField.isSecureTextEntry = false
        } else {
            eyeOffButton.isHidden = true
            eyeButton.isHidden = false
            
            textField.isSecureTextEntry = true
        }
    }
}

// MARK: - UITextFieldDelegate
extension ITCHTextField: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        returnAction?()
        return true
    }
}
