//
//  ITCHTeacherCell.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHTeacherCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHTeacherCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum Avatar {
            static let backgroundColor: UIColor = ITCHColor.cellGray.color
            static let clipsToBounds: Bool = true
            static let contentMode: UIView.ContentMode = .scaleAspectFill
            static let cornerRadius: CGFloat = 16
            static let leadingOffset: CGFloat = 16
            static let topOffset: CGFloat = 12
            static let size: CGFloat = 32
        }
        
        enum Title {
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let textColor: UIColor = ITCHColor.base0.color
            static let leadingOffset: CGFloat = 12
            static let trailingOffset: CGFloat = 16
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let avatarImageView: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    func configure(with text: String, image: UIImage?) {
        titleLabel.text = text
        avatarImageView.image = image
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        selectionStyle = Constant.View.selectionStyle
        setUpAvatarImageView()
        setTitleLabel()
    }
    
    private func setUpAvatarImageView() {
        avatarImageView.backgroundColor = Constant.Avatar.backgroundColor
        avatarImageView.clipsToBounds = Constant.Avatar.clipsToBounds
        avatarImageView.contentMode = Constant.Avatar.contentMode
        avatarImageView.layer.cornerRadius = Constant.Avatar.cornerRadius
        
        addSubview(avatarImageView)
        avatarImageView.pinLeft(to: self, Constant.Avatar.leadingOffset)
        avatarImageView.pinTop(to: self, Constant.Avatar.topOffset)
        avatarImageView.setHeight(Constant.Avatar.size)
        avatarImageView.setWidth(Constant.Avatar.size)
    }
    
    private func setTitleLabel() {
        titleLabel.font = Constant.Title.font
        titleLabel.textColor = Constant.Title.textColor
        
        addSubview(titleLabel)
        titleLabel.pinCenterY(to: avatarImageView)
        titleLabel.pinLeft(to: avatarImageView.trailingAnchor, Constant.Title.leadingOffset)
        titleLabel.pinRight(to: self, Constant.Title.trailingOffset)
    }
}
