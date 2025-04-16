//
//  ITCHSettingsRow.swift
//  ITCHUIComponents
//
//  Created by Peter on 13.04.2025.
//

import UIKit

public final class ITCHSettingsRow: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum LeftImage {
            static let size: CGFloat = 32
        }
        
        enum Chevron {
            static let size: CGFloat = 16
            static let image: UIImage = ITCHImage.chevronRight16.image
        }
        
        enum TextStack {
            static let titleTextColor: UIColor = ITCHColor.base5.color
            static let titleFont: UIFont = ITCHFont.bodyMMedium.font
            static let subtitleTextColor: UIColor = ITCHColor.base50.color
            static let subtitleFont: UIFont = ITCHFont.captionRegular.font
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let leadingOffset: CGFloat = 8
            static let verticalOffset: CGFloat = 3.5
            static let trailingOffset: CGFloat = 8
        }
    }
    
    // MARK: - UI Components
    private let leftImageView: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    private let subtitleLabel: UILabel = UILabel()
    private let textStack: UIStackView = UIStackView()
    private let chevronImageView: UIImageView = UIImageView()
    
    // MARK: - Lifecycle
    public init() {
        super.init(frame: .zero)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    public func configure(with model: ITCHSettingsModel) {
        leftImageView.image = model.leftImage
        titleLabel.text = model.titleText
        subtitleLabel.text = model.subtitleText
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpLeftImageView()
        setUpChevronImageView()
        setUpTextStack()
    }
    
    private func setUpLeftImageView() {
        addSubview(leftImageView)
        leftImageView.pinLeft(to: self)
        leftImageView.pinCenterY(to: self)
        leftImageView.setWidth(Constant.LeftImage.size)
    }
    
    private func setUpChevronImageView() {
        chevronImageView.image = Constant.Chevron.image
        
        addSubview(chevronImageView)
        chevronImageView.pinCenterY(to: self)
        chevronImageView.pinRight(to: self)
        chevronImageView.setWidth(Constant.Chevron.size)
    }
    
    private func setUpTextStack() {
        titleLabel.textColor = Constant.TextStack.titleTextColor
        titleLabel.font = Constant.TextStack.titleFont
    
        subtitleLabel.textColor = Constant.TextStack.subtitleTextColor
        subtitleLabel.font = Constant.TextStack.subtitleFont
        
        [titleLabel, subtitleLabel].forEach { element in
            textStack.addArrangedSubview(element)
        }
        
        textStack.axis = Constant.TextStack.axis
        
        addSubview(textStack)
        textStack.pinLeft(to: leftImageView.trailingAnchor, Constant.TextStack.leadingOffset)
        textStack.pinVertical(to: self, Constant.TextStack.verticalOffset)
        textStack.pinRight(to: chevronImageView.leadingAnchor, Constant.TextStack.trailingOffset)
    }
}
