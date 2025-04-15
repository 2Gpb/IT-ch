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
            static let textColor: UIColor = ITCHColor.base0.color
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let numberOfLines: Int = 0
        }
        
        enum Location {
            static let image: UIImage = ITCHImage.location16.image
            static let textColor: UIColor = ITCHColor.base30.color
            static let font: UIFont = ITCHFont.captionMedium.font
            static let spacing: CGFloat = 4
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let imageSize: CGFloat = 16
        }
        
        enum BottomStack {
            static let spacing: CGFloat = 24
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let topOffset: CGFloat = 12
            static let alignment: UIStackView.Alignment = .center
            static let distribution: UIStackView.Distribution = .fill
        }
        
        enum TimeInterval {
            static let textColor: UIColor = ITCHColor.base30.color
            static let font: UIFont = ITCHFont.captionMedium.font
        }
    }
    
    // MARK: - UI Components
    private let courseNameLabel: UILabel = UILabel()
    private let locationImageView: UIImageView = UIImageView()
    private let locationLabel: UILabel = UILabel()
    private let locationStack: UIStackView = UIStackView()
    private let timeIntervalLabel: UILabel = UILabel()
    private let bottomStack: UIStackView = UIStackView()
    
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
    public func configure(with model: ITCHScheduleModel) {
        courseNameLabel.text = model.courseName
        locationLabel.text = model.location
        timeIntervalLabel.text = model.timeInterval
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpCourseNameLabel()
        setUpLocationStack()
        setUpBottomStack()
    }
    
    private func setUpCourseNameLabel() {
        courseNameLabel.textColor = Constant.CourseName.textColor
        courseNameLabel.font = Constant.CourseName.font
        courseNameLabel.numberOfLines = Constant.CourseName.numberOfLines
        
        addSubview(courseNameLabel)
        courseNameLabel.pinTop(to: self)
        courseNameLabel.pinLeft(to: self)
        courseNameLabel.pinRight(to: self)
    }
    
    private func setUpLocationStack() {
        locationImageView.image = Constant.Location.image
        locationImageView.setWidth(Constant.Location.imageSize)
        
        locationLabel.textColor = Constant.Location.textColor
        locationLabel.font = Constant.Location.font
        locationLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        [locationImageView, locationLabel].forEach { element in
            locationStack.addArrangedSubview(element)
        }
        
        locationStack.axis = Constant.Location.axis
        locationStack.spacing = Constant.Location.spacing
    }
    
    private func setUpBottomStack() {
        timeIntervalLabel.textColor = Constant.TimeInterval.textColor
        timeIntervalLabel.font = Constant.TimeInterval.font
        
        [locationStack, timeIntervalLabel].forEach { element in
            bottomStack.addArrangedSubview(element)
        }
        
        bottomStack.axis = Constant.BottomStack.axis
        bottomStack.distribution = Constant.BottomStack.distribution
        bottomStack.alignment = Constant.BottomStack.alignment
        bottomStack.spacing = Constant.BottomStack.spacing
        
        addSubview(bottomStack)
        bottomStack.pinTop(to: courseNameLabel.bottomAnchor, Constant.BottomStack.topOffset)
        bottomStack.pinLeft(to: self)
        bottomStack.pinRight(to: self)
    }
}
