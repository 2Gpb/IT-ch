//
//  ITCHClassRecordView.swift
//  ITCHUIComponents
//
//  Created by Peter on 10.04.2025.
//

import UIKit
import ITCHUtilities

public final class ITCHClassRecordView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let cornerRadius: CGFloat = 12
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
        }
        
        enum Date {
            static let textColor: UIColor = ITCHColor.base30.color
            static let font: UIFont = ITCHFont.bodySMedium.font
            static let format: String = "EEEE, d MMMM"
            static let leadingOffset: CGFloat = 20
            static let topOffset: CGFloat = 16
        }
        
        enum Separator {
            static let backgroundColor: UIColor = ITCHColor.base70.color
            static let height: CGFloat = 1
            static let horizontalOffset: CGFloat = 20
            static let topOffset: CGFloat = 8
        }
        
        enum NavigationRows {
            static let recordTitle: String = "Запись занятия"
            static let editTitle: String = "Редактировать"
            static let horizontalOffset: CGFloat = 20
            static let bottomOffset: CGFloat = 8
        }
    }
    
    // MARK: - UI Components
    private let dateLabel: UILabel = UILabel()
    private let separatorView: UIView = UIView()
    private let navigationRow: ITCHNavigationRow = ITCHNavigationRow(type: .chevron)
    private let secondNavigationRow: ITCHNavigationRow = ITCHNavigationRow(type: .chevron)
    
    // MARK: - Variables
    private var firstRowBottomConstraint: NSLayoutConstraint?
    private var secondRowBottomConstraint: NSLayoutConstraint?
    
    // MARK: - Properties
    public var openRecordAction: (() -> Void)? {
        didSet {
            navigationRow.action = openRecordAction
        }
    }
    
    public var editAction: (() -> Void)? {
        didSet {
            secondNavigationRow.action = editAction
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
    public func configure(for type: ITCHCourseUserRole, with date: Date) {
        dateLabel.text = date.configure(to: Constant.Date.format).uppercased()
        
        switch type {
        case .student:
            secondNavigationRow.removeFromSuperview()
            firstRowBottomConstraint?.isActive = true
            secondRowBottomConstraint?.isActive = false

        case .teacher:
            firstRowBottomConstraint?.isActive = false
            secondRowBottomConstraint?.isActive = true
        default:
            break
        }
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpDateTitle()
        setUpSeparatorView()
        setUpNavigationRow()
        setUpSecondNavigationRow()
    }
    
    private func setUpView() {
        backgroundColor = Constant.View.backgroundColor
        layer.cornerRadius = Constant.View.cornerRadius
    }
    
    private func setUpDateTitle() {
        dateLabel.textColor = Constant.Date.textColor
        dateLabel.font = Constant.Date.font
        
        addSubview(dateLabel)
        dateLabel.pinLeft(to: self, Constant.Date.leadingOffset)
        dateLabel.pinTop(to: self, Constant.Date.topOffset)
    }
    
    private func setUpSeparatorView() {
        separatorView.backgroundColor = Constant.Separator.backgroundColor
        
        addSubview(separatorView)
        separatorView.pinTop(to: dateLabel.bottomAnchor, Constant.Separator.topOffset)
        separatorView.pinHorizontal(to: self, Constant.Separator.horizontalOffset)
        separatorView.setHeight(Constant.Separator.height)
    }
    
    private func setUpNavigationRow() {
        navigationRow.configure(title: Constant.NavigationRows.recordTitle)
        
        addSubview(navigationRow)
        navigationRow.pinTop(to: separatorView.bottomAnchor)
        navigationRow.pinHorizontal(to: self, Constant.NavigationRows.horizontalOffset)
        firstRowBottomConstraint = navigationRow.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -Constant.NavigationRows.bottomOffset
        )
        
        firstRowBottomConstraint?.isActive = false
    }
    
    private func setUpSecondNavigationRow() {
        secondNavigationRow.configure(title: Constant.NavigationRows.editTitle)
        
        addSubview(secondNavigationRow)
        secondNavigationRow.pinTop(to: navigationRow.bottomAnchor)
        secondNavigationRow.pinHorizontal(to: self, Constant.NavigationRows.horizontalOffset)
        secondNavigationRow.pinBottom(to: self, Constant.NavigationRows.bottomOffset)
        secondRowBottomConstraint = secondNavigationRow.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -Constant.NavigationRows.bottomOffset
        )
        
        secondRowBottomConstraint?.isActive = false
    }
}
