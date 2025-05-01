//
//  ITCHNotificationCell.swift
//  ITCHUIComponents
//
//  Created by Peter on 14.04.2025.
//

import UIKit

public final class ITCHNotificationView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let cornerRadius: CGFloat = 12
            static let backgroundColor: UIColor = ITCHColor.cellLightGray.color
        }
        
        enum CourseName {
            static let textColor: UIColor = ITCHColor.base30.color
            static let font: UIFont = ITCHFont.captionRegular.font
            static let topOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 20
        }
        
        enum NotificationStack {
            static let textColor: UIColor = ITCHColor.base0.color
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let image: UIImage = ITCHImage.chevronRight16.image
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let imageSize: CGFloat = 16
            static let spacing: CGFloat = 20
            static let topOffset: CGFloat = 8
            static let horizontalOffset: CGFloat = 20
        }
        
        enum Date {
            static let textColor: UIColor = ITCHColor.base30.color
            static let font: UIFont = ITCHFont.bodySMedium.font
            static let dateFormat: String = "dd.MM.yy 'в' HH:mm"
            static let topOffset: CGFloat = 12
            static let bottomOffset: CGFloat = 16
            static let leadingOffset: CGFloat = 20
            static let leadingOffsetWithView: CGFloat = 4
        }
        
        enum NewNotification {
            static let image: UIImage = ITCHImage.newNotification12.image
            static let isHidden: Bool = true
            static let topOffset: CGFloat = 14.5
            static let leadingOffset: CGFloat = 20
        }
    }
    
    // MARK: - UI Components
    private let courseNameLabel: UILabel = UILabel()
    private let notificationTextLabel: UILabel = UILabel()
    private let chevronImageView: UIImageView = UIImageView()
    private let notificationTextStack: UIStackView = UIStackView()
    private let newNotificationImageView: UIImageView = UIImageView()
    private let dateLabel: UILabel = UILabel()
    
    // MARK: - Private variables
    private var dateLabelLeadingToLeftImage: NSLayoutConstraint?
    private var dateLabelLeadingToSuperview: NSLayoutConstraint?
    
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
    public func configure(with model: ITCHNotificationViewModel) {
        courseNameLabel.text = model.courseName
        notificationTextLabel.text = model.notification
        dateLabel.text = model.date.configure(to: Constant.Date.dateFormat)
        
        dateLabelLeadingToSuperview?.isActive = !model.isNewNotify
        dateLabelLeadingToLeftImage?.isActive = model.isNewNotify
        newNotificationImageView.isHidden = !model.isNewNotify
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpCourseNameLabel()
        setUpNotificationTextStack()
        setUpDateLabel()
        setUpNewNotificationImageView()
    }
    
    private func setUpView() {
        backgroundColor = Constant.View.backgroundColor
        layer.cornerRadius = Constant.View.cornerRadius
    }
    
    private func setUpCourseNameLabel() {
        courseNameLabel.textColor = Constant.CourseName.textColor
        courseNameLabel.font = Constant.CourseName.font
        
        addSubview(courseNameLabel)
        courseNameLabel.pinTop(to: self, Constant.CourseName.topOffset)
        courseNameLabel.pinHorizontal(to: self, Constant.CourseName.horizontalOffset)
    }
    
    private func setUpNotificationTextStack() {
        notificationTextLabel.textColor = Constant.NotificationStack.textColor
        notificationTextLabel.font = Constant.NotificationStack.font
        
        chevronImageView.image = Constant.NotificationStack.image
        chevronImageView.setHeight(Constant.NotificationStack.imageSize)
        chevronImageView.setWidth(Constant.NotificationStack.imageSize)
        
        [notificationTextLabel, chevronImageView].forEach { element in
            notificationTextStack.addArrangedSubview(element)
        }
        
        notificationTextStack.axis = Constant.NotificationStack.axis
        notificationTextStack.spacing = Constant.NotificationStack.spacing
        
        addSubview(notificationTextStack)
        notificationTextStack.pinTop(to: courseNameLabel.bottomAnchor, Constant.NotificationStack.topOffset)
        notificationTextStack.pinHorizontal(to: self, Constant.NotificationStack.horizontalOffset)
    }
    
    private func setUpDateLabel() {
        dateLabel.textColor = Constant.Date.textColor
        dateLabel.font = Constant.Date.font
        
        addSubview(dateLabel)
        dateLabel.pinTop(to: notificationTextStack.bottomAnchor, Constant.Date.topOffset)
        dateLabel.pinBottom(to: self, Constant.Date.bottomOffset)
        
        dateLabelLeadingToLeftImage = dateLabel.leadingAnchor.constraint(
            equalTo: newNotificationImageView.trailingAnchor,
            constant: Constant.Date.leadingOffsetWithView
        )
        
        dateLabelLeadingToSuperview = dateLabel.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: Constant.Date.leadingOffset
        )
        
        dateLabelLeadingToSuperview?.isActive = true
    }
    
    private func setUpNewNotificationImageView() {
        newNotificationImageView.image = Constant.NewNotification.image
        newNotificationImageView.isHidden = Constant.NewNotification.isHidden
        
        addSubview(newNotificationImageView)
        newNotificationImageView.pinTop(to: notificationTextStack.bottomAnchor, Constant.NewNotification.topOffset)
        newNotificationImageView.pinLeft(to: self, Constant.NewNotification.leadingOffset)
    }
}
