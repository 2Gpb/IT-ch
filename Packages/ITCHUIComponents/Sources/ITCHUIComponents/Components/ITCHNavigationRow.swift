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
            static let isHidden: Bool = true
        }
        
        enum Title {
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let textColor: UIColor = ITCHColor.base0.color
            static let leftOffset: CGFloat = 12
        }
        
        enum Chevron {
            static let image: UIImage? = ITCHImage.chevronRight16.image
            static let dimension: CGFloat = 18
            static let verticalOffset: CGFloat = 12
        }
        
        enum Checkmark {
            static let image: UIImage? = ITCHImage.tick16.image
            static let dimension: CGFloat = 18
            static let verticalOffset: CGFloat = 12
        }
    }
    
    // MARK: - UI Components
    private let leftImageView: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    private let chevronImageView: UIImageView = UIImageView()
    private let checkmarkImageView: UIImageView = UIImageView()
    
    // MARK: - Private variables
    private var titleLabelLeadingToLeftImage: NSLayoutConstraint?
    private var titleLabelLeadingToSuperview: NSLayoutConstraint?
    
    // MARK: - Properties
    public var action: (() -> Void)?
    public var isCheck = false {
        didSet {
            checkmarkImageView.isHidden = !isCheck
        }
    }
    
    // MARK: - Lifecycle
    public init(type: ITCHNavigationRowType) {
        super.init(frame: .zero)
        setUp(with: type)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    public func configure(title: String, image: UIImage? = nil) {
        titleLabel.text = title
        leftImageView.image = image
        
        titleLabelLeadingToLeftImage?.isActive = false
        titleLabelLeadingToSuperview?.isActive = false
        
        if image != nil {
            titleLabelLeadingToLeftImage?.isActive = true
            titleLabelLeadingToSuperview?.isActive = false
            leftImageView.isHidden = false
        } else {
            titleLabelLeadingToSuperview?.isActive = true
        }
    }
    
    // MARK: - SetUp
    private func setUp(with type: ITCHNavigationRowType) {
        setUpLeftImageView()
        setUpTitleLabel()
        setUpChevronImageView()
        setUpCheckmarkImageView()
        
        switch type {
        case .checkmark:
            chevronImageView.isHidden = true
        case .chevron:
            checkmarkImageView.isHidden = true
        }
    }
    
    private func setUpLeftImageView() {
        leftImageView.isHidden = Constant.LeftImage.isHidden
        
        addSubview(leftImageView)
        leftImageView.pinLeft(to: self)
        leftImageView.pinCenterY(to: self)
        leftImageView.setHeight(Constant.LeftImage.dimension)
        leftImageView.setWidth(Constant.LeftImage.dimension)
    }
    
    private func setUpTitleLabel() {
        titleLabel.font = Constant.Title.font
        titleLabel.textColor = Constant.Title.textColor
        
        addSubview(titleLabel)
        titleLabel.pinCenterY(to: self)
        
        titleLabelLeadingToLeftImage = titleLabel.leadingAnchor.constraint(
            equalTo: leftImageView.trailingAnchor,
            constant: Constant.Title.leftOffset
        )
        
        titleLabelLeadingToSuperview = titleLabel.leadingAnchor.constraint(
            equalTo: self.leadingAnchor
        )
        
        titleLabelLeadingToSuperview?.isActive = true
    }
    
    private func setUpChevronImageView() {
        chevronImageView.image = Constant.Chevron.image
        
        addSubview(chevronImageView)
        chevronImageView.pinRight(to: self)
        chevronImageView.pinVertical(to: self, Constant.Chevron.verticalOffset)
        chevronImageView.setHeight(Constant.Chevron.dimension)
        chevronImageView.setWidth(Constant.Chevron.dimension)
    }
    
    private func setUpCheckmarkImageView() {
        checkmarkImageView.image = Constant.Checkmark.image
        
        addSubview(checkmarkImageView)
        checkmarkImageView.pinRight(to: self)
        checkmarkImageView.pinVertical(to: self, Constant.Checkmark.verticalOffset)
        checkmarkImageView.setHeight(Constant.Checkmark.dimension)
        checkmarkImageView.setWidth(Constant.Checkmark.dimension)
    }
}
