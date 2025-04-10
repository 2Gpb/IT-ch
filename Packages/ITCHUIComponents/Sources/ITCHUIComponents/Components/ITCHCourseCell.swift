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
        }
        
        enum Info {
            static let rolePrefix: String = "Роль: "
            static let topOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 20
        }
        
        enum CourseName {
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 20
            static let chevronSize: CGFloat = 16
        }
        
        enum TeacherName {
            static let topOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 20
            static let bottomOffset: CGFloat = 16
            static let photoSize: CGFloat = 32
            static let photoCornerRadius: CGFloat = 16
            static let spacing: CGFloat = 8
        }
    }
    
    // MARK: - UI Components
    private let durationLabel: UILabel = UILabel()
    private let roleLabel: UILabel = UILabel()
    private let infoStack: UIStackView = UIStackView()
    private let courseNameLabel: UILabel = UILabel()
    private let chevronImage: UIImageView = UIImageView()
    private let courseNameStack: UIStackView = UIStackView()
    private let photoImageView: UIImageView = UIImageView()
    private let teacherNameLabel: UILabel = UILabel()
    private let teacherNameStack: UIStackView = UIStackView()
    
    // MARK: - Lifecycle
    public init(
        duration: String,
        role: String,
        courseName: String,
        teacherName: String,
        image: UIImage
    ) {
        super.init(frame: .zero)
        setUp(
            duration: duration,
            role: role,
            courseName: courseName,
            teacherName: teacherName,
            image: image
        )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(
        duration: String,
        role: String,
        courseName: String,
        teacherName: String,
        image: UIImage
    ) {
        backgroundColor = ITCHColor.backgroundGray.color
        layer.cornerRadius = Constant.View.cornerRadius
        
        durationLabel.text = duration
        roleLabel.text = Constant.Info.rolePrefix + role
        courseNameLabel.text = courseName
        teacherNameLabel.text = teacherName
        
        setUpInfoStack()
        setUpCourseNameStack()
        setUpTeacherNameStack()
    }
    
    private func setUpInfoStack() {
        [durationLabel, roleLabel].forEach { label in
            label.font = ITCHFont.bodySMedium.font
            label.textColor = ITCHColor.base30.color
            infoStack.addArrangedSubview(label)
        }
        
        infoStack.axis = .horizontal
        infoStack.distribution = .fill
        
        addSubview(infoStack)
        infoStack.pinTop(to: self, Constant.Info.topOffset)
        infoStack.pinHorizontal(to: self, Constant.Info.horizontalOffset)
    }
    
    private func setUpCourseNameStack() {
        courseNameLabel.font = ITCHFont.bodyMMedium.font
        courseNameLabel.textColor = ITCHColor.base0.color
        
        chevronImage.image = ITCHImage.arrowRightLight16.image
        chevronImage.setWidth(Constant.CourseName.chevronSize)
        chevronImage.setHeight(Constant.CourseName.chevronSize)
        
        courseNameStack.addArrangedSubview(courseNameLabel)
        courseNameStack.addArrangedSubview(chevronImage)
        courseNameStack.axis = .horizontal
        courseNameStack.distribution = .fill
        
        addSubview(courseNameStack)
        courseNameStack.pinTop(to: infoStack.bottomAnchor, Constant.CourseName.topOffset)
        courseNameStack.pinHorizontal(to: self, Constant.CourseName.horizontalOffset)
    }
    
    private func setUpTeacherNameStack() {
        photoImageView.backgroundColor = ITCHColor.backgroundDark.color
        photoImageView.layer.cornerRadius = Constant.TeacherName.photoCornerRadius
        photoImageView.setWidth(Constant.TeacherName.photoSize)
        photoImageView.setHeight(Constant.TeacherName.photoSize)
        
        teacherNameLabel.font = ITCHFont.bodySMedium.font
        teacherNameLabel.textColor = ITCHColor.base30.color
        
        teacherNameStack.addArrangedSubview(photoImageView)
        teacherNameStack.addArrangedSubview(teacherNameLabel)
        teacherNameStack.axis = .horizontal
        teacherNameStack.alignment = .center
        teacherNameStack.spacing = Constant.TeacherName.spacing
        
        addSubview(teacherNameStack)
        teacherNameStack.pinTop(to: courseNameStack.bottomAnchor, Constant.TeacherName.topOffset)
        teacherNameStack.pinHorizontal(to: self, Constant.TeacherName.horizontalOffset)
        teacherNameStack.pinBottom(to: self, Constant.TeacherName.bottomOffset)
    }
}
