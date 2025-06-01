//
//  ITCHUserRow.swift
//  ITCHUIComponents
//
//  Created by Peter on 13.04.2025.
//

import UIKit

public final class ITCHAccountRow: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let height: CGFloat = 48
        }
        
        enum Avatar {
            static let backgroundColor: UIColor = ITCHColor.cellGray.color
            static let contentMode: UIView.ContentMode = .scaleAspectFill
            static let clipsToBounds: Bool = true
            static let size: CGFloat = 48
            static let cornerRadius: CGFloat = 24
        }
        
        enum AvatarLabel {
            static let textColor: UIColor = ITCHColor.blue60.color
            static let font: UIFont = ITCHFont.header5Medium.font
        }
        
        enum RightImage {
            static let size: CGFloat = 24
            static let chevronImage: UIImage = ITCHImage.chevronRight24.image
            static let deleteImage: UIImage = ITCHImage.trash24.image
            static let optionsImage: UIImage = ITCHImage.options24.image
            static let chekBoxImage: UIImage = ITCHImage.checkbox28.image
            static let chekBoxFillImage: UIImage = ITCHImage.checkboxFill28.image
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
    private let rightImageView: UIImageView = UIImageView()
    private let rightButton: ITCHCustomButton = ITCHCustomButton(type: .system)
    private let avatarPlusImageView: UIImageView = UIImageView()
    
    // MARK: - Properties
    public var isCheck: Bool = false {
        didSet {
            rightImageView.image = isCheck ? Constant.RightImage.chekBoxFillImage : Constant.RightImage.chekBoxImage
        }
    }
    public var rightAction: (() -> Void)?
    
    // MARK: - Lifecycle
    public init(type: ITCHAccountRowType) {
        super.init(frame: .zero)
        setUp(with: type)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    public func configure(with model: ITCHAccountViewModel) {
        avatarImageView.image = model.image
        avatarLabel.text = model.name.first?.description.uppercased() // makeInitials(from: model.name)
        nameLabel.text = (avatarLabel.text ?? "") + model.name.dropFirst()
        aboutInfoLabel.text = model.info
    }
    
    public func configureRightButtonMenu(items: [UIAction]) {
        rightButton.menu = UIMenu(children: items)
        rightButton.showsMenuAsPrimaryAction = true
    }
    
    // MARK: - SetUp
    private func setUp(with type: ITCHAccountRowType) {
        setHeight(Constant.View.height)
        setUpAvatarImageView()
        setUpRightImageView()
        rightImageView.setWidth(type == .checkBox ? 28 : Constant.RightImage.size)
        setUpRightButton()
        
        switch type {
        case .account, .addAccount:
            rightImageView.image = Constant.RightImage.chevronImage
        case .checkBox:
            rightImageView.image = Constant.RightImage.chekBoxImage
        case .deleteAccount:
            rightImageView.isHidden = true
            rightButton.isHidden = false
            rightButton.setImage(Constant.RightImage.deleteImage, for: .normal)
        case .options:
            rightImageView.isHidden = true
            rightButton.isHidden = false
            rightButton.setImage(Constant.RightImage.optionsImage, for: .normal)
        case .defaultAccount:
            rightImageView.image = nil
        }

        switch type {
        case .addAccount:
            setUpAvatarPlusImageView()
            attachTitle()
        default:
            setUpAvatarLabel()
            setUpTextStack()
        }
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
    
    private func setUpRightImageView() {
        addSubview(rightImageView)
        rightImageView.pinCenterY(to: self)
        rightImageView.pinRight(to: self)
    }
    
    private func setUpRightButton() {
        rightButton.isHidden = true
        rightButton.tintColor = ITCHColor.blue60.color
        rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
        
        addSubview(rightButton)
        rightButton.pinRight(to: self)
        rightButton.pinCenterY(to: self)
    }
    
    private func setUpAvatarLabel() {
        avatarLabel.font = Constant.AvatarLabel.font
        avatarLabel.textColor = Constant.AvatarLabel.textColor
        
        avatarImageView.addSubview(avatarLabel)
        avatarLabel.pinCenter(to: avatarImageView)
    }
    
    private func setUpNameLabel() {
        nameLabel.textColor = Constant.TextStack.nameTextColor
        nameLabel.font = Constant.TextStack.nameFont
    }
    
    private func setUpTextStack() {
        setUpNameLabel()
        
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
        textStack.pinRight(to: rightImageView.leadingAnchor, Constant.TextStack.trailingOffset)
    }
    
    private func setUpAvatarPlusImageView() {
        avatarPlusImageView.image = ITCHImage.plus32.image
        
        avatarImageView.addSubview(avatarPlusImageView)
        avatarPlusImageView.pinCenter(to: avatarImageView)
    }
    
    private func attachTitle() {
        setUpNameLabel()
        
        addSubview(nameLabel)
        nameLabel.pinLeft(to: avatarImageView.trailingAnchor, Constant.TextStack.leadingOffset)
        nameLabel.pinCenterY(to: self)
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
    
    // MARK: - Actions
    @objc
    private func rightButtonAction() {
        rightAction?()
    }
}
