//
//  ITCHNotificationCell.swift
//  ITCHUIComponents
//
//  Created by Peter on 14.04.2025.
//

import UIKit

public final class ITCHNotificationCell: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let cornerRadius: CGFloat = 12
        }
        
        enum CourseName {
            static let topOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 20
        }
        
        enum NotificationTextStack {
            static let imageSize: CGFloat = 16
            static let spacing: CGFloat = 20
            static let topOffset: CGFloat = 8
            static let horizontalOffset: CGFloat = 20
        }
        
        enum DateLabel {
            static let dateFormat: String = "dd.MM.yy 'в' HH:mm"
            static let topOffset: CGFloat = 12
            static let bottomOffset: CGFloat = 16
            static let leadingOffset: CGFloat = 20
            static let leadingOffsetWithView: CGFloat = 4
        }
        
        enum NotificationImage {
            static let topOffset: CGFloat = 14.5
            static let leadingOffset: CGFloat = 20
        }
    }
    
    // MARK: - UI Components
    private let courseNameLabel: UILabel = UILabel()
    private let notificationTextLabel: UILabel = UILabel()
    private let chevronImage: UIImageView = UIImageView()
    private let notificationTextStack: UIStackView = UIStackView()
    private let newNotificationImage: UIImageView = UIImageView()
    private let dateLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    public init(
        courseName: String,
        notification: String,
        date: Date,
        isNewNotify: Bool = false
    ) {
        super.init(frame: .zero)
        setUp(
            courseName: courseName,
            notificationText: notification,
            date: date,
            isNewNotify: isNewNotify
        )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(
        courseName: String,
        notificationText: String,
        date: Date,
        isNewNotify: Bool
    ) {
        backgroundColor = ITCHColor.cellLightGray.color
        layer.cornerRadius = Constant.View.cornerRadius
        
        setUpCourseNameLabel(with: courseName)
        setUpNotificationTextStack(with: notificationText)
        setUpDateLabel(with: date, isNewNotify: isNewNotify)
    }
    
    private func setUpCourseNameLabel(with text: String) {
        courseNameLabel.text = text
        courseNameLabel.textColor = ITCHColor.base30.color
        courseNameLabel.font = ITCHFont.captionRegular.font
        
        addSubview(courseNameLabel)
        courseNameLabel.pinTop(to: self, Constant.CourseName.topOffset)
        courseNameLabel.pinHorizontal(to: self, Constant.CourseName.horizontalOffset)
    }
    
    private func setUpNotificationTextStack(with text: String) {
        notificationTextLabel.text = text
        notificationTextLabel.textColor = ITCHColor.base0.color
        notificationTextLabel.font = ITCHFont.bodyMMedium.font
        
        chevronImage.image = ITCHImage.chevronRight16.image
        chevronImage.setHeight(Constant.NotificationTextStack.imageSize)
        chevronImage.setWidth(Constant.NotificationTextStack.imageSize)
        
        [notificationTextLabel, chevronImage].forEach { element in
            notificationTextStack.addArrangedSubview(element)
        }
        
        notificationTextStack.axis = .horizontal
        notificationTextStack.spacing = Constant.NotificationTextStack.spacing
        
        addSubview(notificationTextStack)
        notificationTextStack.pinTop(to: courseNameLabel.bottomAnchor, Constant.NotificationTextStack.topOffset)
        notificationTextStack.pinHorizontal(to: self, Constant.NotificationTextStack.horizontalOffset)
    }
    
    private func setUpDateLabel(with date: Date, isNewNotify: Bool) {
        dateLabel.text = date.configure(to: Constant.DateLabel.dateFormat)
        dateLabel.textColor = ITCHColor.base30.color
        dateLabel.font = ITCHFont.bodySMedium.font
        
        addSubview(dateLabel)
        dateLabel.pinTop(to: notificationTextStack.bottomAnchor, Constant.DateLabel.topOffset)
        dateLabel.pinBottom(to: self, Constant.DateLabel.bottomOffset)
        
        if isNewNotify {
            setUpNewNotificationImage()
            dateLabel.pinLeft(to: newNotificationImage.trailingAnchor, Constant.DateLabel.leadingOffsetWithView)
        } else {
            dateLabel.pinLeft(to: self, Constant.DateLabel.leadingOffset)
        }
    }
    
    private func setUpNewNotificationImage() {
        newNotificationImage.image = ITCHImage.newNotification12.image
        
        addSubview(newNotificationImage)
        newNotificationImage.pinTop(to: notificationTextStack.bottomAnchor, Constant.NotificationImage.topOffset)
        newNotificationImage.pinLeft(to: self, Constant.NotificationImage.leadingOffset)
    }
}
