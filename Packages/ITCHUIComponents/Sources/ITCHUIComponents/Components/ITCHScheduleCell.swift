//
//  ITCHScheduleCell.swift
//  ITCHUIComponents
//
//  Created by Peter on 14.04.2025.
//

import UIKit

public final class ITCHScheduleCell: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum CourseName {
            static let numberOfLines: Int = 0
        }
        
        enum Location {
            static let spacing: CGFloat = 4
            static let imageSize: CGFloat = 16
        }
        
        enum BottomStack {
            static let spacing: CGFloat = 24
            static let topOffset: CGFloat = 12
        }
    }
    
    // MARK: - UI Components
    private let courseNameLabel: UILabel = UILabel()
    private let locationImage: UIImageView = UIImageView()
    private let locationText: UILabel = UILabel()
    private let locationStack: UIStackView = UIStackView()
    private let timeIntervalLabel: UILabel = UILabel()
    private let bottomStack: UIStackView = UIStackView()
    
    // MARK: - Lifecycle
    public init(courseName: String, location: String, timeInterval: String) {
        super.init(frame: .zero)
        setUp(courseName: courseName, location: location, timeInterval: timeInterval)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(courseName: String, location: String, timeInterval: String) {
        setUpCourseNameLabel(with: courseName)
        setUpLocationStack(with: location)
        setUpTimeIntervalLabel(with: timeInterval)
        setUpBottomStack()
    }
    
    private func setUpCourseNameLabel(with text: String) {
        courseNameLabel.text = text
        courseNameLabel.textColor = ITCHColor.base0.color
        courseNameLabel.font = ITCHFont.bodyMMedium.font
        courseNameLabel.numberOfLines = Constant.CourseName.numberOfLines
        
        addSubview(courseNameLabel)
        courseNameLabel.pinTop(to: self)
        courseNameLabel.pinLeft(to: self)
        courseNameLabel.pinRight(to: self)
    }
    
    private func setUpLocationStack(with text: String) {
        locationImage.image = ITCHImage.location16.image
        locationImage.setWidth(Constant.Location.imageSize)
        
        locationText.text = text
        locationText.textColor = ITCHColor.base30.color
        locationText.font = ITCHFont.captionMedium.font
        locationText.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        [locationImage, locationText].forEach { element in
            locationStack.addArrangedSubview(element)
        }
        
        locationStack.axis = .horizontal
        locationStack.spacing = Constant.Location.spacing
    }
    
    private func setUpTimeIntervalLabel(with text: String) {
        timeIntervalLabel.text = text
        timeIntervalLabel.textColor = ITCHColor.base30.color
        timeIntervalLabel.font = ITCHFont.captionMedium.font
    }
    
    private func setUpBottomStack() {
        [locationStack, timeIntervalLabel].forEach { element in
            bottomStack.addArrangedSubview(element)
        }
        
        bottomStack.axis = .horizontal
        bottomStack.distribution = .fill
        bottomStack.alignment = .center
        bottomStack.spacing = Constant.BottomStack.spacing
        
        addSubview(bottomStack)
        bottomStack.pinTop(to: courseNameLabel.bottomAnchor, Constant.BottomStack.topOffset)
        bottomStack.pinLeft(to: self)
        bottomStack.pinRight(to: self)
    }
}
