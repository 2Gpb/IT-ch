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
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    // MARK: - lifecycle
    public init(leftImage: UIImage? = nil, rightImage: UIImage? = nil) {
        super.init(frame: .zero)
        setUp(leftImage: leftImage, rightImage: rightImage)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(leftImage: UIImage?, rightImage: UIImage?) {
        setUpTitleLabel()
        setUpLeftButton(with: leftImage)
        setUpRightButton(with: rightImage)
        setHeight(Constant.View.height)
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Title.textColor
        titleLabel.font = Constant.Title.font
        titleLabel.textAlignment = Constant.Title.alignment
        
        addSubview(titleLabel)
        titleLabel.pinCenter(to: self)
    }
    
    private func setUpLeftButton(with image: UIImage?) {
        guard image != nil else { return }
        leftButton.setImage(image, for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        
        addSubview(leftButton)
        leftButton.pinLeft(to: self, Constant.Buttons.leadingOffset)
        leftButton.pinCenterY(to: self)
    }
    
    private func setUpRightButton(with image: UIImage?) {
        guard image != nil else { return }
        rightButton.setImage(image, for: .normal)
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
