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
            static let size: CGFloat = 48
            static let cornerRadius: CGFloat = 24
            static let verticalOffset: CGFloat = 8
        }
        
        enum Chevron {
            static let size: CGFloat = 24
        }
        
        enum TextStack {
            static let spacing: CGFloat = 4
            static let leadingOffset: CGFloat = 12
            static let trailingOffset: CGFloat = 8
        }
    }
    
    // MARK: - UI Components
    private let avatarView: UIImageView = UIImageView()
    private let avatarLabel: UILabel = UILabel()
    private let nameLabel: UILabel = UILabel()
    private let aboutInfoLabel: UILabel = UILabel()
    private let textStack: UIStackView = UIStackView()
    private let chevronImage: UIImageView = UIImageView()
    
    // MARK: - Lifecycle
    public init(image: UIImage? = nil, name: String, info: String) {
        super.init(frame: .zero)
        setUp(name: name, info: info, image: image)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(name: String, info: String, image: UIImage? = nil) {
        setUpAvatarView(with: image)
        setUpAvatarLabel(name: name)
        setUpChevron()
        setUpTextStack(with: name, aboutInfo: info)
    }
    
    private func setUpAvatarView(with image: UIImage?) {
        avatarView.image = image
        avatarView.backgroundColor = ITCHColor.base80.color
        avatarView.contentMode = .scaleAspectFill
        avatarView.clipsToBounds = true
        avatarView.layer.cornerRadius = Constant.Avatar.cornerRadius
        
        addSubview(avatarView)
        avatarView.pinLeft(to: self)
        avatarView.pinVertical(to: self, Constant.Avatar.verticalOffset)
        avatarView.setWidth(Constant.Avatar.size)
        avatarView.setHeight(Constant.Avatar.size)
    }
    
    private func setUpAvatarLabel(name: String) {
        if avatarView.image == nil {
            avatarLabel.isHidden = false
            avatarLabel.text = makeInitials(from: name)
            avatarLabel.font = ITCHFont.header5Medium.font
            avatarLabel.textColor = ITCHColor.blue60.color
        } else {
            avatarLabel.isHidden = true
        }
        
        avatarView.addSubview(avatarLabel)
        avatarLabel.pinCenter(to: avatarView)
    }
    
    private func setUpChevron() {
        chevronImage.image = ITCHImage.chevronRight24.image
        
        addSubview(chevronImage)
        chevronImage.pinCenterY(to: self)
        chevronImage.pinRight(to: self)
        chevronImage.setWidth(Constant.Chevron.size)
    }
    
    private func setUpTextStack(with name: String, aboutInfo: String) {
        nameLabel.text = name
        nameLabel.textColor = ITCHColor.base0.color
        nameLabel.font = ITCHFont.bodyMMedium.font
        
        aboutInfoLabel.text = aboutInfo
        aboutInfoLabel.textColor = ITCHColor.base40.color
        aboutInfoLabel.font = ITCHFont.bodySRegular.font
        
        [nameLabel, aboutInfoLabel].forEach { element in
            textStack.addArrangedSubview(element)
        }
        
        textStack.axis = .vertical
        textStack.spacing = Constant.TextStack.spacing
        
        addSubview(textStack)
        textStack.pinLeft(to: avatarView.trailingAnchor, Constant.TextStack.leadingOffset)
        textStack.pinCenterY(to: self)
        textStack.pinRight(to: chevronImage.leadingAnchor, Constant.TextStack.trailingOffset)
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
