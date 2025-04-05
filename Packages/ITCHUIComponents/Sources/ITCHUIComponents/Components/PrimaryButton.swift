//
//  PrimaryButton.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 08.03.2025.
//

import UIKit

final class PrimaryButton: UIView {
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
    
    // MARK: - Button types
    enum typeButton {
        case primary
        case delete
    }
    
    // MARK: - UI Components
    private let button: UIButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    init(
        title: String?,
        type: typeButton = .primary
    ) {
        super.init(frame: .zero)
        
        button.setTitle(title, for: .normal)
        switch type {
        case .primary:
            button.backgroundColor = UIColor(color: .blue60)
        case .delete:
            button.backgroundColor = UIColor(color: .red50)
        }
        
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp() {
        button.tintColor = UIColor(color: .base0)
        button.titleLabel?.font = ITCHFont.bodySMedium.font
        button.layer.cornerRadius = Constant.Button.cornerRadius
        
        addSubview(button)
        button.pin(to: self)
        button.setHeight(Constant.Button.height)
    }
}
