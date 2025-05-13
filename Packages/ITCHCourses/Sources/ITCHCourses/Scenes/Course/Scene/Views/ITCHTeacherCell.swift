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
        
        enum Title {
            static let topOffset: CGFloat = 12
            static let horizontalOffset: CGFloat = 16
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
        avatarImageView.backgroundColor = ITCHColor.cellGray.color
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 16
        
        addSubview(avatarImageView)
        avatarImageView.pinLeft(to: self, 16)
        avatarImageView.pinTop(to: self, 12)
        avatarImageView.setHeight(32)
        avatarImageView.setWidth(32)
    }
    
    private func setTitleLabel() {
        titleLabel.font = ITCHFont.bodyMMedium.font
        titleLabel.textColor = ITCHColor.base0.color
        
        addSubview(titleLabel)
        titleLabel.pinCenterY(to: avatarImageView)
        titleLabel.pinLeft(to: avatarImageView.trailingAnchor, 8)
        titleLabel.pinRight(to: self, 16)
    }
}
