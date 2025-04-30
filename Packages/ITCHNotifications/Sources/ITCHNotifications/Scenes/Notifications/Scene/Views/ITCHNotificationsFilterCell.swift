//
//  ITCHNotificationsFilterCell.swift
//  ITCHNotifications
//
//  Created by Peter on 30.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHNotificationsFilterCell: UICollectionViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHNotificationFilterCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 16
            static let height: CGFloat = 33
        }
        
        enum Title {
            static let textColor: UIColor = ITCHColor.base0.color
            static let font: UIFont = ITCHFont.bodySMedium.font
            static let horizontalOffset: CGFloat = 20
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - Properties
    var wasSelected: Bool = false {
        didSet {
            contentView.backgroundColor = wasSelected ? ITCHColor.blue60.color : Constant.View.backgroundColor
        }
    }
    
    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpTitleLabel()
    }
    
    private func setUpView() {
        contentView.backgroundColor = Constant.View.backgroundColor
        contentView.layer.cornerRadius = Constant.View.cornerRadius
        contentView.heightAnchor.constraint(equalToConstant: Constant.View.height).isActive = true
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Title.textColor
        titleLabel.font = Constant.Title.font
        
        contentView.addSubview(titleLabel)
        titleLabel.pinCenterY(to: contentView)
        titleLabel.pinHorizontal(to: contentView, Constant.Title.horizontalOffset)
    }
}
