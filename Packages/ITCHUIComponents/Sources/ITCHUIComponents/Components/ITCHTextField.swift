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
        
        enum TitleLabel {
            static let textColor: UIColor = ITCHColor.base60.color
            static let font: UIFont = ITCHFont.bodySRegular.font
        }
        
        enum TextField {
            static let textColor: UIColor = ITCHColor.base10.color
            static let font: UIFont = ITCHFont.bodyMRegular.font
            static let borderWidth: CGFloat = 1
            static let borderColor: CGColor = ITCHColor.cellLightGray.color.cgColor
            static let rightLeftViewMode: UITextField.ViewMode = .always
            static let cornerRadius: CGFloat = 12
            static let topOffset: CGFloat = 8
            static let height: CGFloat = 48
            static let edgeViewsFrame: CGRect = CGRect(x: 0, y: 0, width: 16, height: 1)
            @MainActor static let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .font: ITCHFont.bodyMRegular.font,
                .foregroundColor: ITCHColor.base50.color
            ]
        }
        
        enum HideShowButton {
            static let eyeImage: UIImage = ITCHImage.eye20.image
            static let eyeOffImage: UIImage = ITCHImage.eyeOff20.image
            static let trailingOffset: CGFloat = 16
        }
    }

    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    private let textField: UITextField = UITextField()
    private let leftView: UIView = UIView(frame: Constant.TextField.edgeViewsFrame)
    private let rightView: UIView = UIView(frame: Constant.TextField.edgeViewsFrame)
    private let eyeButton: ITCHCustomButton = ITCHCustomButton()
    private let eyeOffButton: ITCHCustomButton = ITCHCustomButton()
    
    // MARK: - Properties
    public var editingAction: (() -> Void)?
    public var returnAction: (() -> Void)?
    public var insteadKeyboardAction: (() -> Void)?
    public var beforeOpenKeyboardAction: (() -> Void)?
    public var afterCloseKeyboardAction: (() -> Void)?
    public var text: String? {
        get {
            textField.text
        } set {
            textField.text = newValue
        }
    }
    
    public var isError: Bool = false {
        didSet {
            textField.layer.borderColor = isError ?
            ITCHColor.red60.color.cgColor : ITCHColor.cellLightGray.color.cgColor
        }
    }
    
    public var keyboardState: ITCHKeyboardState = .close {
        didSet {
            switch keyboardState {
            case .open:
                textField.becomeFirstResponder()
            case .close:
                textField.resignFirstResponder()
            }
        }
    }
    
    // MARK: - Lifecycle
    public init(type: ITCHTextFieldType = .label) {
        super.init(frame: .zero)
        setUp(with: type)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    public func configure(with model: ITCHTextFieldViewModel) {
        titleLabel.text = model.title
        textField.textAlignment = model.alignment
        textField.attributedPlaceholder = NSAttributedString(
            string: model.placeholder,
            attributes: Constant.TextField.placeholderAttributes
        )
        
        switch model.type {
        case .normal:
            textField.keyboardType = model.keyboardType
        case .password:
            setUpHideShowButton()
            textField.keyboardType = .asciiCapable
            textField.autocorrectionType = .no
        }
    }
    
    public func setInputView(_ inputView: UIView?) {
        textField.inputView = inputView
    }
    
    // MARK: - SetUp
    private func setUp(with type: ITCHTextFieldType) {
        switch type {
        case .label:
            setUpTitleLabel()
            setUpTextField()
            textField.pinTop(to: titleLabel.bottomAnchor, Constant.TextField.topOffset)
        case .normal:
            setUpTextField()
            textField.pinTop(to: self)
        }
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.TitleLabel.textColor
        titleLabel.font = Constant.TitleLabel.font
        
        addSubview(titleLabel)
        titleLabel.pinTop(to: self)
        titleLabel.pinLeft(to: self)
    }
    
    private func setUpTextField() {
        textField.delegate = self
        textField.leftView = leftView
        textField.rightView = rightView
        textField.leftViewMode = Constant.TextField.rightLeftViewMode
        textField.rightViewMode = Constant.TextField.rightLeftViewMode
        textField.textColor = Constant.TextField.textColor
        textField.font = Constant.TextField.font
        textField.layer.cornerRadius = Constant.TextField.cornerRadius
        textField.layer.borderWidth = Constant.TextField.borderWidth
        textField.layer.borderColor = Constant.TextField.borderColor
        textField.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(textFieldTapped)))
        textField.addTarget(self, action: #selector(textWasChanged), for: .editingChanged)
        
        addSubview(textField)
        textField.pinHorizontal(to: self)
        textField.pinBottom(to: self)
        textField.setHeight(Constant.TextField.height)
    }
    
    private func setUpHideShowButton() {
        eyeButton.setImage(Constant.HideShowButton.eyeImage, for: .normal)
        eyeOffButton.setImage(Constant.HideShowButton.eyeOffImage, for: .normal)
        eyeOffButton.isHidden = true
        
        [eyeButton, eyeOffButton].forEach { button in
            button.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
            
            addSubview(button)
            button.pinCenterY(to: textField)
            button.pinRight(to: textField, Constant.HideShowButton.trailingOffset)
        }
    }
    
    // MARK: - Actions
    @objc
    private func textFieldTapped() {
        textField.becomeFirstResponder()
    }
    
    @objc
    private func eyeButtonTapped() {
        eyeButton.isHidden = eyeOffButton.isHidden
        eyeOffButton.isHidden = !eyeOffButton.isHidden
        textField.isSecureTextEntry = !eyeOffButton.isHidden
    }
    
    @objc
    private func textWasChanged() {
        editingAction?()
    }
}

// MARK: - UITextFieldDelegate
extension ITCHTextField: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        returnAction?()
        return true
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        beforeOpenKeyboardAction?()
        
        if let action = insteadKeyboardAction {
            action()
            return false
        }
        
        return true 
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        afterCloseKeyboardAction?()
    }
}
