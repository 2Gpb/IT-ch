//
//  PrimaryNavigationBar.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 13.03.2025.
//

import UIKit

public final class ITCHNavigationBar: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let height: CGFloat = 56
        }
        
        enum Title {
            static let textColor: UIColor = ITCHColor.base0.color
            static let font: UIFont = ITCHFont.header5Medium.font
            static let alignment: NSTextAlignment = .center
        }
        
        enum Buttons {
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
    public func configure(with model: ITCHNavigationBarModel) {
        titleLabel.text = model.title
        if let image = model.leftImage {
            leftButton.setImage(image, for: .normal)
            leftButton.isHidden = false
        }
        
        if let image = model.rightImage {
            rightButton.setImage(image, for: .normal)
            rightButton.isHidden = false
        }
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
        leftButton.isHidden = true
        leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        
        addSubview(leftButton)
        leftButton.pinLeft(to: self, Constant.Buttons.leadingOffset)
        leftButton.pinCenterY(to: self)
    }
    
    private func setUpRightButton() {
        rightButton.isHidden = true
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
