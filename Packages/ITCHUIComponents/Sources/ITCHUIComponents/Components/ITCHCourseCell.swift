//
//  ITCHCourseCell.swift
//  ITCHUIComponents
//
//  Created by Peter on 10.04.2025.
//

import UIKit

public final class ITCHCourseCell: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let cornerRadius: CGFloat = 12
            static let backgroundColor = ITCHColor.backgroundGray.color
        }
        
        enum Info {
            static let font: UIFont = ITCHFont.bodySMedium.font
            static let textColor: UIColor = ITCHColor.base30.color
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let distribution: UIStackView.Distribution = .equalSpacing
            static let rolePrefix: String = "Роль: "
            static let topOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 20
        }
        
        enum CourseName {
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let textColor: UIColor = ITCHColor.base0.color
            static let numberOfLines: Int = 0
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 20
        }
        
        enum Chevron {
            static let image: UIImage = ITCHImage.arrowRightLight16.image
            static let size: CGFloat = 16
            static let topOffset: CGFloat = 20
            static let trailingOffset: CGFloat = 20
        }
        
        enum TeacherName {
            static let font: UIFont = ITCHFont.bodySMedium.font
            static let textColor: UIColor = ITCHColor.base30.color
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let topOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 20
            static let bottomOffset: CGFloat = 16
            static let spacing: CGFloat = 8
        }
        
        enum Avatar {
            static let size: CGFloat = 32
            static let cornerRadius: CGFloat = 16
            static let backgroundColor = ITCHColor.backgroundDark.color
            static let clipToBounds: Bool = true
            static let contentMode: UIView.ContentMode = .scaleAspectFill
        }
    }
    
    // MARK: - UI Components
    private let durationLabel: UILabel = UILabel()
    private let roleLabel: UILabel = UILabel()
    private let infoStack: UIStackView = UIStackView()
    private let courseNameLabel: UILabel = UILabel()
    private let chevronImage: UIImageView = UIImageView()
    private let avatarImageView: UIImageView = UIImageView()
    private let teacherNameLabel: UILabel = UILabel()
    private let teacherNameStack: UIStackView = UIStackView()
    
    // MARK: - Properties
    public var content: ITCHCourseModel? {
        didSet {
            durationLabel.text = content?.duration
            roleLabel.text = Constant.Info.rolePrefix + (content?.role ?? "")
            courseNameLabel.text = content?.courseName
            teacherNameLabel.text = content?.teacherName
            avatarImageView.image = content?.avatar
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
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpInfoStack()
        setUpChevronImage()
        setUpCourseNameLabel()
        setUpTeacherNameStack()
    }
    
    private func setUpView() {
        backgroundColor = Constant.View.backgroundColor
        layer.cornerRadius = Constant.View.cornerRadius
    }
    
    private func setUpInfoStack() {
        [durationLabel, roleLabel].forEach { label in
            label.font = Constant.Info.font
            label.textColor = Constant.Info.textColor
            infoStack.addArrangedSubview(label)
        }
        
        infoStack.axis = Constant.Info.axis
        infoStack.distribution = Constant.Info.distribution
        
        addSubview(infoStack)
        infoStack.pinTop(to: self, Constant.Info.topOffset)
        infoStack.pinHorizontal(to: self, Constant.Info.horizontalOffset)
    }
    
    private func setUpChevronImage() {
        chevronImage.image = Constant.Chevron.image
        chevronImage.setWidth(Constant.Chevron.size)
        chevronImage.setHeight(Constant.Chevron.size)
        
        addSubview(chevronImage)
        chevronImage.pinTop(to: infoStack.bottomAnchor, Constant.Chevron.topOffset)
        chevronImage.pinRight(to: self, Constant.Chevron.trailingOffset)
    }
    
    private func setUpCourseNameLabel() {
        courseNameLabel.font = Constant.CourseName.font
        courseNameLabel.textColor = Constant.CourseName.textColor
        courseNameLabel.numberOfLines = Constant.CourseName.numberOfLines
        
        addSubview(courseNameLabel)
        courseNameLabel.pinTop(to: infoStack.bottomAnchor, Constant.CourseName.topOffset)
        courseNameLabel.pinLeft(to: self, Constant.CourseName.horizontalOffset)
        courseNameLabel.pinRight(to: chevronImage.leadingAnchor, Constant.CourseName.horizontalOffset)
    }
    
    private func setUpTeacherNameStack() {
        setUpTeacherNameStackContent()
        
        [avatarImageView, teacherNameLabel].forEach { element in
            teacherNameStack.addArrangedSubview(element)
        }
        
        teacherNameStack.axis = Constant.TeacherName.axis
        teacherNameStack.spacing = Constant.TeacherName.spacing
        
        addSubview(teacherNameStack)
        teacherNameStack.pinTop(to: courseNameLabel.bottomAnchor, Constant.TeacherName.topOffset)
        teacherNameStack.pinHorizontal(to: self, Constant.TeacherName.horizontalOffset)
        teacherNameStack.pinBottom(to: self, Constant.TeacherName.bottomOffset)
    }
    
    private func setUpTeacherNameStackContent() {
        avatarImageView.backgroundColor = Constant.Avatar.backgroundColor
        avatarImageView.layer.cornerRadius = Constant.Avatar.cornerRadius
        avatarImageView.clipsToBounds = Constant.Avatar.clipToBounds
        avatarImageView.contentMode = Constant.Avatar.contentMode
        avatarImageView.setWidth(Constant.Avatar.size)
        avatarImageView.setHeight(Constant.Avatar.size)
        
        teacherNameLabel.font = Constant.TeacherName.font
        teacherNameLabel.textColor = Constant.TeacherName.textColor
    }
}
