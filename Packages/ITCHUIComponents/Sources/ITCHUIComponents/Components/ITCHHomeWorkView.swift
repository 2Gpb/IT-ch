//
//  ITCHHomeWorkView.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 02.04.2025.
//

import UIKit
import ITCHUtilities

public final class ITCHHomeWorkView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let cornerRadius: CGFloat = 12
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
        }
        
        enum Title {
            static let textColor: UIColor = ITCHColor.base0.color
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let topOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 20
            static let numberOfLines: Int = 0
        }
        
        enum Date {
            static let image: UIImage? = ITCHImage.time20.image
            static let textColor: UIColor = ITCHColor.base30.color
            static let font: UIFont = ITCHFont.bodySMedium.font
            static let dateFormat: String = "dd.MM.yy, HH:mm"
            static let spacing: CGFloat = 4
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let topOffset: CGFloat = 8
            static let leadingOffset: CGFloat = 20
        }
        
        enum Separator {
            static let backgroundColor: UIColor = ITCHColor.base70.color
            static let height: CGFloat = 1
            static let horizontalOffset: CGFloat = 20
            static let topOffset: CGFloat = 8
        }
        
        enum NavigationRows {
            static let openTitle: String = "Открыть"
            static let teacherTitle: String = "Посмотреть решения"
            static let editTitle: String = "Редактировать"
            static let studentTitle: String = "Добавить решение"
            static let assistantTitle: String = "Проверить решения"
            static let horizontalOffset: CGFloat = 20
            static let bottomOffset: CGFloat = 8
        }
    }
    
    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    private let dateStack: UIStackView = UIStackView()
    private let dateLabel: UILabel = UILabel()
    private let dateImageView: UIImageView = UIImageView()
    private let separatorView: UIView = UIView()
    private var navigationRow: ITCHNavigationRow = ITCHNavigationRow(type: .chevron)
    private var secondNavigationRow: ITCHNavigationRow = ITCHNavigationRow(type: .chevron)
    private var thirdNavigationRow: ITCHNavigationRow = ITCHNavigationRow(type: .chevron)
    
    // MARK: - Variables
    private var secondRowBottomConstraint: NSLayoutConstraint?
    private var thirdRowBottomConstraint: NSLayoutConstraint?
    
    // MARK: - Properties
    private var openAction: (() -> Void)? {
        didSet {
            navigationRow.action = openAction
        }
    }
    
    private var solutionsAction: (() -> Void)? {
        didSet {
            secondNavigationRow.action = solutionsAction
        }
    }
    
    private var editAction: (() -> Void)? {
        didSet {
            thirdNavigationRow.action = editAction
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
    public func configure(with model: ITCHHomeWorkViewModel) {
        titleLabel.text = model.title
        dateLabel.text = model.date.configure(to: Constant.Date.dateFormat)
        openAction = model.openAction
        solutionsAction = model.solutionsAction
        editAction = model.editAction
        
        switch model.role {
        case .teacher:
            secondRowBottomConstraint?.isActive = false
            thirdRowBottomConstraint?.isActive = true
        case .student, .assistant:
            secondNavigationRow.configure(
                title: model.role == .student ?
                Constant.NavigationRows.studentTitle :
                Constant.NavigationRows.assistantTitle
            )
            
            thirdNavigationRow.removeFromSuperview()
            secondRowBottomConstraint?.isActive = true
            thirdRowBottomConstraint?.isActive = false
        case .none:
            break
        }
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpTitleLabel()
        setUpDateStack()
        setUpSeparatorView()
        setUpNavigationRow()
        setUpSecondNavigationRow()
        setUpThirdNavigationRow()
    }
    
    private func setUpView() {
        backgroundColor = Constant.View.backgroundColor
        layer.cornerRadius = Constant.View.cornerRadius
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Title.textColor
        titleLabel.font = Constant.Title.font
        titleLabel.numberOfLines = Constant.Title.numberOfLines
        
        addSubview(titleLabel)
        titleLabel.pinTop(to: self, Constant.Title.topOffset)
        titleLabel.pinLeft(to: self, Constant.Title.horizontalOffset)
        titleLabel.pinRight(to: self, Constant.Title.horizontalOffset)
    }
    
    private func setUpDateStack() {
        dateImageView.image = Constant.Date.image
        
        dateLabel.textColor = Constant.Date.textColor
        dateLabel.font = Constant.Date.font
        
        [dateImageView, dateLabel].forEach { element in
            dateStack.addArrangedSubview(element)
        }
         
        dateStack.axis = Constant.Date.axis
        dateStack.spacing = Constant.Date.spacing
        
        addSubview(dateStack)
        dateStack.pinTop(to: titleLabel.bottomAnchor, Constant.Date.topOffset)
        dateStack.pinLeft(to: self, Constant.Date.leadingOffset)
    }
    
    private func setUpSeparatorView() {
        separatorView.backgroundColor = Constant.Separator.backgroundColor
        
        addSubview(separatorView)
        separatorView.pinTop(to: dateStack.bottomAnchor, Constant.Separator.topOffset)
        separatorView.pinHorizontal(to: self, Constant.Separator.horizontalOffset)
        separatorView.setHeight(Constant.Separator.height)
    }
    
    private func setUpNavigationRow() {
        navigationRow.configure(title: Constant.NavigationRows.openTitle)
        
        addSubview(navigationRow)
        navigationRow.pinTop(to: separatorView.bottomAnchor)
        navigationRow.pinHorizontal(to: self, Constant.NavigationRows.horizontalOffset)
    }
    
    private func setUpSecondNavigationRow() {
        secondNavigationRow.configure(title: Constant.NavigationRows.teacherTitle)
        
        addSubview(secondNavigationRow)
        secondNavigationRow.pinTop(to: navigationRow.bottomAnchor)
        secondNavigationRow.pinHorizontal(to: self, Constant.NavigationRows.horizontalOffset)
        secondRowBottomConstraint = secondNavigationRow.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -Constant.NavigationRows.bottomOffset
        )
        
        secondRowBottomConstraint?.isActive = false
    }
    
    private func setUpThirdNavigationRow() {
        thirdNavigationRow.configure(title: Constant.NavigationRows.editTitle)
        
        addSubview(thirdNavigationRow)
        thirdNavigationRow.pinTop(to: secondNavigationRow.bottomAnchor)
        thirdNavigationRow.pinHorizontal(to: self, Constant.NavigationRows.horizontalOffset)
        thirdRowBottomConstraint = thirdNavigationRow.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -Constant.NavigationRows.bottomOffset
        )
        
        thirdRowBottomConstraint?.isActive = false
    }
}
