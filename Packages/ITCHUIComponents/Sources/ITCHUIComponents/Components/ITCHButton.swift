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
        }
    }
    
    // MARK: - UI Components
    private let button: UIButton = UIButton(type: .system)
    
    // MARK: - Properties
    public var action: (() -> Void)?
    
    // MARK: - Lifecycle
    public init(
        title: String,
        type: ITCHButtonType = .primary
    ) {
        super.init(frame: .zero)
        
        setUp(title: title)
        switch type {
        case .primary:
            button.backgroundColor = ITCHColor.blue60.color
        case .delete:
            button.backgroundColor = ITCHColor.red50.color
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(title: String) {
        button.setTitle(title, for: .normal)
        button.tintColor = ITCHColor.base0.color
        button.titleLabel?.font = ITCHFont.bodyMMedium.font
        button.layer.cornerRadius = Constant.Button.cornerRadius
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
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
