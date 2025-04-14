//
//  PrimaryNavigationRow.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 13.03.2025.
//

import UIKit

public final class ITCHNavigationRow: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum LeftImage {
            static let dimension: CGFloat = 28
        }
        
        enum TitleLabel {
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let textColor: UIColor = ITCHColor.base0.color
            static let leftOffset: CGFloat = 12
        }
        
        enum Chevron {
            static let image: UIImage? = ITCHImage.chevronRight16.image
            static let dimension: CGFloat = 18
            static let verticalOffset: CGFloat = 12
        }
    }
    
    // MARK: - UI Components
    private let leftImageView: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    private let chevronImageView: UIImageView = UIImageView()
    
    // MARK: - Properties
    public var action: (() -> Void)?
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    // MARK: - Lifecycle
    public init(leftImage: UIImage? = nil) {
        super.init(frame: .zero)
        setUp(leftImage: leftImage)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(leftImage: UIImage?) {
        setUpLeftImageView(with: leftImage)
        setUpTitleLabel()
        setUpChevron()
        setUpGesture()
    }
    
    private func setUpLeftImageView(with image: UIImage?) {
        guard image != nil else { return }
        leftImageView.image = image
        
        addSubview(leftImageView)
        leftImageView.pinLeft(to: self)
        leftImageView.pinCenterY(to: self)
        leftImageView.setHeight(Constant.LeftImage.dimension)
        leftImageView.setWidth(Constant.LeftImage.dimension)
    }
    
    private func setUpTitleLabel() {
        titleLabel.font = Constant.TitleLabel.font
        titleLabel.textColor = Constant.TitleLabel.textColor
        
        addSubview(titleLabel)
        titleLabel.pinCenterY(to: self)
        
        if leftImageView.image == nil {
            titleLabel.pinLeft(to: self)
        } else {
            titleLabel.pinLeft(to: leftImageView.trailingAnchor, Constant.TitleLabel.leftOffset)
        }
    }
    
    private func setUpChevron() {
        chevronImageView.image = Constant.Chevron.image
        
        addSubview(chevronImageView)
        chevronImageView.pinRight(to: self)
        chevronImageView.pinVertical(to: self, Constant.Chevron.verticalOffset)
        chevronImageView.setHeight(Constant.Chevron.dimension)
        chevronImageView.setWidth(Constant.Chevron.dimension)
    }
    
    private func setUpGesture() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewAction)))
    }
    
    // MARK: - Actions
    @objc
    private func viewAction() {
        action?()
    }
}
