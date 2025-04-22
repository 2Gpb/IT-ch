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
        
        enum Title {
            static let textColor: UIColor = ITCHColor.base5.color
            static let font: UIFont = ITCHFont.header4.font
            static let alignment: NSTextAlignment = .center
        }
        
        enum Subtitle {
            static let textColor: UIColor = ITCHColor.base5.color
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let alignment: NSTextAlignment = .center
            static let topOffset: CGFloat = 24
            static let numberOfLines: Int = 2
        }
    }
    
    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    private let subtitleLabel: UILabel = UILabel()
    
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
    public func configure(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        setHeight(93)
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpTitleLabel()
        setUpSubtitleLabel()
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Title.textColor
        titleLabel.font = Constant.Title.font
        titleLabel.textAlignment = Constant.Title.alignment
        
        addSubview(titleLabel)
        titleLabel.pinTop(to: self)
        titleLabel.pinCenterX(to: self)
    }
    
    private func setUpSubtitleLabel() {
        subtitleLabel.textColor = Constant.Subtitle.textColor
        subtitleLabel.font = Constant.Subtitle.font
        subtitleLabel.textAlignment = Constant.Subtitle.alignment
        subtitleLabel.numberOfLines = Constant.Subtitle.numberOfLines
        
        addSubview(subtitleLabel)
        subtitleLabel.pinTop(to: titleLabel.bottomAnchor, Constant.Subtitle.topOffset)
        subtitleLabel.pinHorizontal(to: self)
    }
}
