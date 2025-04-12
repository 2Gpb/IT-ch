//
//  ITCH.swift
//  ITCHUIComponents
//
//  Created by Peter on 12.04.2025.
//

import UIKit

public final class ITCHEmptyStateView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum Description {
            static let topOffset: CGFloat = 24
            static let numberOfLines: Int = 2
        }
    }
    
    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    public init(title: String, description: String) {
        super.init(frame: .zero)
        setUp(titleText: title, descriptionText: description)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(titleText: String, descriptionText: String) {
        setUpTitle(with: titleText)
        setUpDescription(with: descriptionText)
    }
    
    private func setUpTitle(with text: String) {
        titleLabel.text = text
        titleLabel.textColor = ITCHColor.base5.color
        titleLabel.font = ITCHFont.header4.font
        titleLabel.textAlignment = .center
        
        addSubview(titleLabel)
        titleLabel.pinTop(to: self)
        titleLabel.pinCenterX(to: self)
    }
    
    private func setUpDescription(with text: String) {
        descriptionLabel.text = text
        descriptionLabel.textColor = ITCHColor.base5.color
        descriptionLabel.font = ITCHFont.bodyMMedium.font
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = Constant.Description.numberOfLines
        
        addSubview(descriptionLabel)
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, Constant.Description.topOffset)
        descriptionLabel.pinHorizontal(to: self)
    }
}
