//
//  ITCHCourseHeaderCell.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHCourseHeaderCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHCourseHeaderCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }

        enum Label {
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let textColor: UIColor = ITCHColor.base50.color
            static let horizontalOffset: CGFloat = 16
            static let topOffset: CGFloat = 20
        }
        
        enum Separator {
            static let backgroundColor: UIColor = ITCHColor.base70.color
            static let height: CGFloat = 1
            static let topOffset: CGFloat = 12
            static let horizontalOffset: CGFloat = 16
            static let bottomOffset: CGFloat = 6
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - Properties
    private var titleBottom: NSLayoutConstraint?
    private var separatorBottom: NSLayoutConstraint?
    
    private var stackTopWithTitle: NSLayoutConstraint?
    private var stackTopWithSeparator: NSLayoutConstraint?

    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    private let separatorView: UIView = UIView()
    private let stack = UIStackView()

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        titleLabel.isHidden = true
//        separatorView.isHidden = true
    }
    
    // MARK: - Configure
    func configure(with title: String?) {
        if let title {
            titleLabel.text = title
            titleLabel.isHidden = false
            separatorView.isHidden = true
        } else {
            titleLabel.isHidden = true
            separatorView.isHidden = false
        }
    }

    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        selectionStyle = Constant.View.selectionStyle
        setUpTitleLabel()
        setUpSeparator()
    }
    
//    private func setUp() {
//        backgroundColor = Constant.View.backgroundColor
//        selectionStyle = Constant.View.selectionStyle
//
//        stack.addArrangedSubview(titleLabel)
//        stack.addArrangedSubview(separatorView)
//        stack.axis = .vertical
//        stack.spacing = 12
//        stack.translatesAutoresizingMaskIntoConstraints = false
//
//        contentView.addSubview(stack)
//        
//        stackTopWithTitle = stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.Label.topOffset)
//        stackTopWithSeparator = stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.Separator.topOffset)
//        
//        stackTopWithTitle?.isActive = true
//        
//        NSLayoutConstraint.activate([
//            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.Label.horizontalOffset),
//            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.Label.horizontalOffset),
//            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.Separator.bottomOffset)
//        ])
//
//        separatorView.setHeight(Constant.Separator.height)
//
//        titleLabel.textColor = Constant.Label.textColor
//        titleLabel.font = Constant.Label.font
//        separatorView.backgroundColor = Constant.Separator.backgroundColor
//    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Label.textColor
        titleLabel.font = Constant.Label.font
        
        contentView.addSubview(titleLabel)
        titleLabel.pinHorizontal(to: contentView, Constant.Label.horizontalOffset)
        titleLabel.pinTop(to: contentView, Constant.Label.topOffset)
//        titleBottom = titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        titleBottom?.isActive = true
    }
    
    private func setUpSeparator() {
        separatorView.backgroundColor = Constant.Separator.backgroundColor
        separatorView.isHidden = true
        
        contentView.addSubview(separatorView)
        separatorView.setHeight(Constant.Separator.height)
        separatorView.pinTop(to: contentView, Constant.Separator.topOffset)
        separatorView.pinHorizontal(to: contentView, Constant.Separator.horizontalOffset)
//        separatorBottom = separatorView.bottomAnchor.constraint(
//            equalTo: contentView.bottomAnchor,
//            constant: -Constant.Separator.bottomOffset
//        )
//        
//        separatorBottom?.isActive = true
    }
}
