//
//  ITCHDeadlineView.swift
//  ITCHUIComponents
//
//  Created by Peter on 12.04.2025.
//

import UIKit

public final class ITCHDeadlineView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum CheckBox {
            static let size: CGFloat = 32
        }
        
        enum TextStack {
            static let spacing: CGFloat = 4
        }
        
        enum DeadlineStack {
            static let spacing: CGFloat = 4
            static let timeImageSize: CGFloat = 16
            static let dateFormat: String = "d MMMM yyyy, H:mm"
        }
        
        enum InfoStack {
            static let spacing: CGFloat = 8
            static let topOffset: CGFloat = 8
            static let trailingOffset: CGFloat = 8
            static let leadingOffset: CGFloat = 12
            static let bottomOffset: CGFloat = 8
        }
        
        enum FireImage {
            static let size: CGFloat = 24
            static let threeDaysInSeconds: TimeInterval = 60 * 60 * 24 * 3
        }
    }
    
    // MARK: - UI Components
    private let checkBox: UIImageView = UIImageView()
    private let courseName: UILabel = UILabel()
    private let titleLabel: UILabel = UILabel()
    private let textStack: UIStackView = UIStackView()
    private let timeImage: UIImageView = UIImageView()
    private let deadlineLabel: UILabel = UILabel()
    private let deadlineStack: UIStackView = UIStackView()
    private let infoStack: UIStackView = UIStackView()
    private let fireImage: UIImageView = UIImageView()
    
    // MARK: - Properties
    public var isCheck = false {
        didSet {
            checkBox.image = isCheck ? ITCHImage.checkboxFill32.image : ITCHImage.checkbox32.image
        }
    }
    
    // MARK: - Lifecycle
    public init(course: String, title: String, deadline: Date) {
        super.init(frame: .zero)
        setUp(courseName: course, titleText: title, deadlineDate: deadline)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(courseName: String, titleText: String, deadlineDate: Date) {
        setUpFireImage(isHidden: !(deadlineDate.timeIntervalSinceNow <= Constant.FireImage.threeDaysInSeconds))
        setUpCheckBox()
        setUpTextStack(course: courseName, title: titleText)
        setUpDeadlineStack(with: deadlineDate)
        setUpInfoStack()
    }
    
    private func setUpCheckBox() {
        checkBox.image = ITCHImage.checkbox32.image
        
        addSubview(checkBox)
        checkBox.pinCenterY(to: self)
        checkBox.pinLeft(to: self)
        checkBox.setWidth(Constant.CheckBox.size)
    }
    
    private func setUpTextStack(course: String, title: String) {
        courseName.text = course
        courseName.textColor = ITCHColor.base40.color
        courseName.font = ITCHFont.captionRegular.font
        
        titleLabel.text = title
        titleLabel.textColor = ITCHColor.base0.color
        titleLabel.font = ITCHFont.bodyMMedium.font
        
        [courseName, titleLabel].forEach { element in
            textStack.addArrangedSubview(element)
        }
        
        textStack.axis = .vertical
        textStack.spacing = Constant.TextStack.spacing
    }
    
    private func setUpDeadlineStack(with deadline: Date) {
        deadlineLabel.text = deadline.configure(to: Constant.DeadlineStack.dateFormat)
        deadlineLabel.textColor = ITCHColor.red50.color
        deadlineLabel.font = ITCHFont.bodySRegular.font
        
        timeImage.image = ITCHImage.time16.image
        timeImage.setWidth(Constant.DeadlineStack.timeImageSize)
        
        [timeImage, deadlineLabel].forEach { element in
            deadlineStack.addArrangedSubview(element)
        }
        
        deadlineStack.axis = .horizontal
        deadlineStack.spacing = Constant.DeadlineStack.spacing
    }
    
    private func setUpInfoStack() {
        [textStack, deadlineStack].forEach { element in
            infoStack.addArrangedSubview(element)
        }
        
        infoStack.axis = .vertical
        infoStack.spacing = Constant.InfoStack.spacing
        
        addSubview(infoStack)
        infoStack.pinTop(to: self, Constant.InfoStack.topOffset)
        infoStack.pinLeft(to: checkBox.trailingAnchor, Constant.InfoStack.leadingOffset)
        infoStack.pinRight(to: fireImage.leadingAnchor, Constant.InfoStack.trailingOffset)
        infoStack.pinBottom(to: self, Constant.InfoStack.bottomOffset)
    }
    
    private func setUpFireImage(isHidden: Bool) {
        fireImage.image = ITCHImage.fire24.image
        fireImage.isHidden = isHidden
        
        addSubview(fireImage)
        fireImage.pinCenterY(to: self)
        fireImage.pinRight(to: self)
        fireImage.setWidth(Constant.FireImage.size)
    }
}
