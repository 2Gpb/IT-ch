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
    
    // MARK: - UI Components
    private let button: UIButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    init(
        title: String?,
        type: ButtonType = .primary
    ) {
        super.init(frame: .zero)
        
        button.setTitle(title, for: .normal)
        switch type {
        case .primary:
            button.backgroundColor = ITCHColor.blue60.color
        case .delete:
            button.backgroundColor = ITCHColor.red50.color
        }
        
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp() {
        button.tintColor = ITCHColor.base0.color
        button.titleLabel?.font = ITCHFont.bodySMedium.font
        button.layer.cornerRadius = Constant.Button.cornerRadius
        
        addSubview(button)
        button.pin(to: self)
        button.setHeight(Constant.Button.height)
    }
}
