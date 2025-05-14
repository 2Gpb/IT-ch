//
//  ITCHPresentNavigationBar.swift
//  ITCHUIComponents
//
//  Created by Peter on 14.05.2025.
//

import UIKit

public final class ITCHPresentNavigationBar: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let height: CGFloat = 42
        }
        
        enum Title {
            static let textColor: UIColor = ITCHColor.base0.color
            static let font: UIFont = ITCHFont.navBarMedium.font
            static let alignment: NSTextAlignment = .center
        }
        
        enum Buttons {
            static let leftTitle: String = "Отмена"
            static let rightTitle: String = "Готово"
            static let font: UIFont = ITCHFont.navBarRegular.font
            static let tintColor: UIColor = ITCHColor.blue60.color
            static let leadingOffset: CGFloat = 16
            static let trailingOffset: CGFloat = 16
        }
    }
    
    // MARK: - UI Components
    private let leftButton: ITCHCustomButton = ITCHCustomButton(type: .system)
    private let titleLabel: UILabel = UILabel()
    private let rightButton: ITCHCustomButton = ITCHCustomButton(type: .system)
    
    // MARK: - Properties
    public var leftAction: (() -> Void)?
    public var rightAction: (() -> Void)?
    
    // MARK: - lifecycle
    public init() {
        super.init(frame: .zero)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    public func configure(with title: String) {
        titleLabel.text = title
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpTitleLabel()
        setUpLeftButton()
        setUpRightButton()
        setHeight(Constant.View.height)
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Title.textColor
        titleLabel.font = Constant.Title.font
        titleLabel.textAlignment = Constant.Title.alignment
        
        addSubview(titleLabel)
        titleLabel.pinCenter(to: self)
    }
    
    private func setUpLeftButton() {
        leftButton.setTitle(Constant.Buttons.leftTitle, for: .normal)
        leftButton.titleLabel?.font = Constant.Buttons.font
        leftButton.tintColor = Constant.Buttons.tintColor
        leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        
        addSubview(leftButton)
        leftButton.pinLeft(to: self, Constant.Buttons.leadingOffset)
        leftButton.pinCenterY(to: self)
    }
    
    private func setUpRightButton() {
        rightButton.setTitle(Constant.Buttons.rightTitle, for: .normal)
        rightButton.titleLabel?.font = Constant.Buttons.font
        rightButton.tintColor = Constant.Buttons.tintColor
        rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
        
        addSubview(rightButton)
        rightButton.pinRight(to: self, Constant.Buttons.trailingOffset)
        rightButton.pinCenterY(to: self)
    }
    
    // MARK: - Actions
    @objc
    private func leftButtonAction() {
        leftAction?()
    }
    
    @objc
    private func rightButtonAction() {
        rightAction?()
    }
}
