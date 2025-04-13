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
        }
        
        enum TextStack {
            static let leadingOffset: CGFloat = 8
            static let verticalOffset: CGFloat = 3.5
            static let trailingOffset: CGFloat = 8
        }
    }
    
    // MARK: - UI Components
    private let leftImage: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    private let subtitleLabel: UILabel = UILabel()
    private let textStack: UIStackView = UIStackView()
    private let chevronImage: UIImageView = UIImageView()
    
    // MARK: - Lifecycle
    public init(image: UIImage, title: String, subtitle: String) {
        super.init(frame: .zero)
        setUp(leftImage: image, titleText: title, subtitleText: subtitle)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(
        leftImage: UIImage,
        titleText: String,
        subtitleText: String
    ) {
        setUpLeftImage(with: leftImage)
        setUpChevronImage()
        setUpTextStack(with: titleText, subtitle: subtitleText)
    }
    
    private func setUpLeftImage(with image: UIImage) {
        leftImage.image = image
        
        addSubview(leftImage)
        leftImage.pinLeft(to: self)
        leftImage.pinCenterY(to: self)
        leftImage.setWidth(Constant.LeftImage.size)
    }
    
    private func setUpChevronImage() {
        chevronImage.image = ITCHImage.chevronRight16.image
        
        addSubview(chevronImage)
        chevronImage.pinCenterY(to: self)
        chevronImage.pinRight(to: self)
        chevronImage.setWidth(Constant.Chevron.size)
    }
    
    private func setUpTextStack(with title: String, subtitle: String) {
        titleLabel.text = title
        titleLabel.textColor = ITCHColor.base5.color
        titleLabel.font = ITCHFont.bodyMMedium.font
        
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = ITCHColor.base50.color
        subtitleLabel.font = ITCHFont.captionRegular.font
        
        [titleLabel, subtitleLabel].forEach { element in
            textStack.addArrangedSubview(element)
        }
        
        textStack.axis = .vertical
        
        addSubview(textStack)
        textStack.pinLeft(to: leftImage.trailingAnchor, Constant.TextStack.leadingOffset)
        textStack.pinVertical(to: self, Constant.TextStack.verticalOffset)
        textStack.pinRight(to: chevronImage.leadingAnchor, Constant.TextStack.trailingOffset)
    }
}
