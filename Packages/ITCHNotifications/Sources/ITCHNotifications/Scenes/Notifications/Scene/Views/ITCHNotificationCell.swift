//
//  ITCHNotificationCell.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHNotificationCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHNotificationCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum Notification {
            static let horizontalOffset: CGFloat = 16
            static let topOffset: CGFloat = 20
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let notificationView: ITCHNotificationView = ITCHNotificationView()
    
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
    func configure(with model: ITCHNotificationViewModel) {
        notificationView.configure(with: model)
    }
    
    // MARK: - SetUp
    private func setUp() {
        selectionStyle = Constant.View.selectionStyle
        backgroundColor = Constant.View.backgroundColor
        
        contentView.addSubview(notificationView)
        notificationView.pinHorizontal(to: contentView, Constant.Notification.horizontalOffset)
        notificationView.pinTop(to: contentView, Constant.Notification.topOffset)
        notificationView.pinBottom(to: contentView)
    }
}
