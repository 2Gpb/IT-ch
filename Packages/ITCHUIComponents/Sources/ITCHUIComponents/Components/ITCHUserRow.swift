//
//  ITCHUserRow.swift
//  ITCHUIComponents
//
//  Created by Peter on 13.04.2025.
//

import UIKit

public final class ITCHUserRow: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum Avatar {
            static let backgroundColor: UIColor = ITCHColor.base80.color
            static let contentMode: UIView.ContentMode = .scaleAspectFill
            static let clipsToBounds: Bool = true
            static let size: CGFloat = 48
            static let cornerRadius: CGFloat = 24
//            static let verticalOffset: CGFloat = 8
        }
        
        enum AvatarLabel {
            static let textColor: UIColor = ITCHColor.blue60.color
            static let font: UIFont = ITCHFont.header5Medium.font
        }
        
        enum Chevron {
            static let size: CGFloat = 24
            static let image: UIImage = ITCHImage.chevronRight24.image
        }
        
        enum TextStack {
            static let nameTextColor: UIColor = ITCHColor.base0.color
            static let nameFont: UIFont = ITCHFont.bodyMMedium.font
            static let aboutTextColor: UIColor = ITCHColor.base40.color
            static let aboutFont: UIFont = ITCHFont.bodySRegular.font
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let spacing: CGFloat = 4
            static let leadingOffset: CGFloat = 12
            static let trailingOffset: CGFloat = 8
        }
    }
    
    // MARK: - UI Components
    private let avatarImageView: UIImageView = UIImageView()
    private let avatarLabel: UILabel = UILabel()
    private let nameLabel: UILabel = UILabel()
    private let aboutInfoLabel: UILabel = UILabel()
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
    public func configure(with model: ITCHUserModel) {
        if let image = model.image {
            avatarImageView.image = image
        } else {
            setUpAvatarLabel(with: model.name)
        }
        
        nameLabel.text = model.name
        aboutInfoLabel.text = model.info
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpAvatarImageView()
        setUpChevronImageView()
        setUpTextStack()
    }
    
    private func setUpAvatarImageView() {
        avatarImageView.backgroundColor = Constant.Avatar.backgroundColor
        avatarImageView.contentMode = Constant.Avatar.contentMode
        avatarImageView.clipsToBounds = Constant.Avatar.clipsToBounds
        avatarImageView.layer.cornerRadius = Constant.Avatar.cornerRadius
        
        addSubview(avatarImageView)
        avatarImageView.pinLeft(to: self)
        avatarImageView.pinCenterY(to: self)
        avatarImageView.setWidth(Constant.Avatar.size)
        avatarImageView.setHeight(Constant.Avatar.size)
    }
    
    private func setUpAvatarLabel(with name: String) {
        avatarLabel.text = makeInitials(from: name)
        avatarLabel.font = Constant.AvatarLabel.font
        avatarLabel.textColor = Constant.AvatarLabel.textColor
        
        avatarImageView.addSubview(avatarLabel)
        avatarLabel.pinCenter(to: avatarImageView)
    }
    
    private func setUpChevronImageView() {
        chevronImageView.image = Constant.Chevron.image
        
        addSubview(chevronImageView)
        chevronImageView.pinCenterY(to: self)
        chevronImageView.pinRight(to: self)
        chevronImageView.setWidth(Constant.Chevron.size)
    }
    
    private func setUpTextStack() {
        nameLabel.textColor = Constant.TextStack.nameTextColor
        nameLabel.font = Constant.TextStack.nameFont
        
        aboutInfoLabel.textColor = Constant.TextStack.aboutTextColor
        aboutInfoLabel.font = Constant.TextStack.aboutFont
        
        [nameLabel, aboutInfoLabel].forEach { element in
            textStack.addArrangedSubview(element)
        }
        
        textStack.axis = Constant.TextStack.axis
        textStack.spacing = Constant.TextStack.spacing
        
        addSubview(textStack)
        textStack.pinLeft(to: avatarImageView.trailingAnchor, Constant.TextStack.leadingOffset)
        textStack.pinCenterY(to: self)
        textStack.pinRight(to: chevronImageView.leadingAnchor, Constant.TextStack.trailingOffset)
    }
    
    // MARK: - Private methods
    private func makeInitials(from fullName: String?) -> String {
        guard let components = fullName?.components(separatedBy: " "),
              let first = components.first,
              let second = components.dropFirst().first else {
            return ""
        }

        let firstInitial = first.first.map { String($0) } ?? ""
        let secondInitial = second.first.map { String($0) } ?? ""

        return firstInitial + secondInitial
    }
}
