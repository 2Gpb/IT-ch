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
            static let image: UIImage = ITCHImage.checkbox32.image
        }
        
        enum TextStack {
            static let courseNameFont: UIFont = ITCHFont.captionRegular.font
            static let courseNameTextColor: UIColor = ITCHColor.base40.color
            static let titleFont: UIFont = ITCHFont.bodyMMedium.font
            static let titleTextColor: UIColor = ITCHColor.base0.color
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let spacing: CGFloat = 4
        }
        
        enum Deadline {
            static let spacing: CGFloat = 4
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let textColor: UIColor = ITCHColor.red50.color
            static let font: UIFont = ITCHFont.bodySRegular.font
            static let image: UIImage = ITCHImage.time16.image
            static let timeImageSize: CGFloat = 16
            static let dateFormat: String = "d MMMM yyyy, H:mm"
        }
        
        enum Info {
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let spacing: CGFloat = 8
            static let topOffset: CGFloat = 8
            static let trailingOffset: CGFloat = 12
            static let leadingOffset: CGFloat = 12
            static let bottomOffset: CGFloat = 8
        }
        
        enum Fire {
            static let size: CGFloat = 24
            static let image: UIImage = ITCHImage.fire24.image
            static let threeDaysInSeconds: TimeInterval = 60 * 60 * 24 * 3
        }
    }
    
    // MARK: - UI Components
    private let checkBoxImageView: UIImageView = UIImageView()
    private let courseNameLabel: UILabel = UILabel()
    private let titleLabel: UILabel = UILabel()
    private let textStack: UIStackView = UIStackView()
    private let timeImageView: UIImageView = UIImageView()
    private let deadlineLabel: UILabel = UILabel()
    private let deadlineStack: UIStackView = UIStackView()
    private let infoStack: UIStackView = UIStackView()
    private let fireImageView: UIImageView = UIImageView()
    
    // MARK: - Properties
    public var isCheck = false {
        didSet {
            checkBoxImageView.image = isCheck ? ITCHImage.checkboxFill32.image : ITCHImage.checkbox32.image
        }
    }
    
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
    public func configure(with model: ITCHDeadlineModel) {
        courseNameLabel.text = model.course
        titleLabel.text = model.text
        deadlineLabel.text = model.deadline.configure(to: Constant.Deadline.dateFormat)
        fireImageView.isHidden = !(model.deadline.timeIntervalSinceNow <= Constant.Fire.threeDaysInSeconds)
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpCheckBoxImage()
        setUpFireImage()
        setUpTextStack()
        setUpDeadlineStack()
        setUpInfoStack()
    }
    
    private func setUpCheckBoxImage() {
        checkBoxImageView.image = Constant.CheckBox.image
        
        addSubview(checkBoxImageView)
        checkBoxImageView.pinCenterY(to: self)
        checkBoxImageView.pinLeft(to: self)
        checkBoxImageView.setWidth(Constant.CheckBox.size)
    }
    
    private func setUpFireImage() {
        fireImageView.image = Constant.Fire.image
        
        addSubview(fireImageView)
        fireImageView.pinCenterY(to: self)
        fireImageView.pinRight(to: self)
        fireImageView.setWidth(Constant.Fire.size)
    }
    
    private func setUpTextStack() {
        courseNameLabel.textColor = Constant.TextStack.courseNameTextColor
        courseNameLabel.font = Constant.TextStack.titleFont
        
        titleLabel.textColor = Constant.TextStack.titleTextColor
        titleLabel.font = Constant.TextStack.titleFont
        
        [courseNameLabel, titleLabel].forEach { element in
            textStack.addArrangedSubview(element)
        }
        
        textStack.axis = Constant.TextStack.axis
        textStack.spacing = Constant.TextStack.spacing
    }
    
    private func setUpDeadlineStack() {
        deadlineLabel.textColor = Constant.Deadline.textColor
        deadlineLabel.font = Constant.Deadline.font
        
        timeImageView.image = Constant.Deadline.image
        timeImageView.setWidth(Constant.Deadline.timeImageSize)
        
        [timeImageView, deadlineLabel].forEach { element in
            deadlineStack.addArrangedSubview(element)
        }
        
        deadlineStack.axis = Constant.Deadline.axis
        deadlineStack.spacing = Constant.Deadline.spacing
    }
    
    private func setUpInfoStack() {
        [textStack, deadlineStack].forEach { element in
            infoStack.addArrangedSubview(element)
        }
        
        infoStack.axis = Constant.Info.axis
        infoStack.spacing = Constant.Info.spacing
        
        addSubview(infoStack)
        infoStack.pinTop(to: self, Constant.Info.topOffset)
        infoStack.pinLeft(to: checkBoxImageView.trailingAnchor, Constant.Info.leadingOffset)
        infoStack.pinRight(to: fireImageView.leadingAnchor, Constant.Info.trailingOffset)
        infoStack.pinBottom(to: self, Constant.Info.bottomOffset)
    }
}
