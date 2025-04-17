//
//  PrimaryButton.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 08.03.2025.
//

import UIKit

public final class ITCHButton: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum Button {
            static let height: CGFloat = 48
            static let cornerRadius: CGFloat = 12
            static let textColor: UIColor = ITCHColor.base0.color
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let backgroundColor: UIColor = ITCHColor.blue60.color
            static let deleteBackgroundColor: UIColor = ITCHColor.red50.color
            static let secondaryBackground: UIColor = .clear
            static let blueTextColor: UIColor = ITCHColor.blue60.color
        }
    }
    
    // MARK: - UI Components
    private let button: UIButton = UIButton(type: .system)
    
    // MARK: - Properties
    public var action: (() -> Void)?
    
    // MARK: - Lifecycle
    public init(title: String, type: ITCHButtonType = .primary) {
        super.init(frame: .zero)
        setUp(title: title, type: type)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(title: String, type: ITCHButtonType) {
        button.setTitle(title, for: .normal)
        button.tintColor = Constant.Button.textColor
        button.titleLabel?.font = Constant.Button.font
        button.layer.cornerRadius = Constant.Button.cornerRadius
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        switch type {
        case .primary:
            button.backgroundColor = Constant.Button.backgroundColor
        case .secondary:
            button.backgroundColor = Constant.Button.secondaryBackground
            button.tintColor = Constant.Button.blueTextColor
        case .delete:
            button.backgroundColor = Constant.Button.deleteBackgroundColor
        }
        
        addSubview(button)
        button.pin(to: self)
        button.setHeight(Constant.Button.height)
    }
    
    // MARK: - Actions
    @objc
    private func buttonAction() {
        action?()
    }
}
