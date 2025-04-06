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
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let height: CGFloat = 56
        }
        
        enum Buttons {
            static let dimension: CGFloat = 50
            static let leftOffset: CGFloat = 16
            static let rightOffset: CGFloat = 16
        }
    }
    
    // MARK: - UI Components
    private let leftButton: ITCHCustomButton = ITCHCustomButton(type: .system)
    private let title: UILabel = UILabel()
    private let rightButton: ITCHCustomButton = ITCHCustomButton(type: .system)
    
    // MARK: - Properties
    public var leftAction: (() -> Void)?
    public var rightAction: (() -> Void)?
    
    // MARK: - lifecycle
    public init(
        title: String,
        leftImage: UIImage? = nil,
        rightImage: UIImage? = nil
    ) {
        super.init(frame: .zero)
    
        setUp(
            title: title,
            leftImage: leftImage,
            rightImage: rightImage
        )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(
        title: String,
        leftImage: UIImage?,
        rightImage: UIImage?
    ) {
        self.title.text = title
        leftButton.setImage(leftImage, for: .normal)
        rightButton.setImage(rightImage, for: .normal)
        setHeight(Constant.View.height)
        
        setUpTitle()
        setUpLeftView()
        setUpRightView()
    }
    
    private func setUpTitle() {
        title.textColor = ITCHColor.base0.color
        title.font = ITCHFont.header5Medium.font
        title.textAlignment = .center
        
        addSubview(title)
        title.pinCenter(to: self)
    }
    
    private func setUpLeftView() {
        guard leftButton.currentImage != nil else { return }
        leftButton.backgroundColor = .clear
        leftButton.tintColor = ITCHColor.blue60.color
        leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        
        addSubview(leftButton)
        leftButton.pinLeft(to: self, Constant.Buttons.leftOffset)
        leftButton.pinCenterY(to: self)
    }
    
    private func setUpRightView() {
        guard rightButton.currentImage != nil else { return }
        rightButton.backgroundColor = .clear
        rightButton.tintColor = ITCHColor.blue60.color
        rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
        
        addSubview(rightButton)
        rightButton.pinRight(to: self, Constant.Buttons.rightOffset)
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
