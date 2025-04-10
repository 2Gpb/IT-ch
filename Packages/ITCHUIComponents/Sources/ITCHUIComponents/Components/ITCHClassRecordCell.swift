//
//  ITCHClassRecordCell.swift
//  ITCHUIComponents
//
//  Created by Peter on 10.04.2025.
//

import UIKit

public final class ITCHClassRecordCell: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let cornerRadius: CGFloat = 12
        }
        
        enum Date {
            static let format: String = "EEEE, d MMMM"
            static let leadingOffset: CGFloat = 20
            static let topOffset: CGFloat = 16
        }
        
        enum Separator {
            static let height: CGFloat = 1
            static let horizontalOffset: CGFloat = 20
            static let topOffset: CGFloat = 8
        }
        
        enum NavigationRows {
            static let recordTitle: String = "Запись занятия"
            static let editTitle: String = "Редактировать"
            static let horizontalOffset: CGFloat = 20
            static let bottomOffset: CGFloat = 16
        }
    }
    
    // MARK: - UI Components
    private let dateLabel: UILabel = UILabel()
    private let separator: UIView = UIView()
    private let navigationRow: ITCHNavigationRow = ITCHNavigationRow(title: Constant.NavigationRows.recordTitle)
    private let secondNavigationRow: ITCHNavigationRow = ITCHNavigationRow(title: Constant.NavigationRows.editTitle)
    
    // MARK: - Properties
    public var firstAction: (() -> Void)? {
        didSet {
            navigationRow.action = firstAction
        }
    }
    
    public var secondAction: (() -> Void)? {
        didSet {
            secondNavigationRow.action = secondAction
        }
    }
    
    // MARK: - Lifecycle
    public init(
        type: ITCHClassRecordCellType,
        date: Date
    ) {
        super.init(frame: .zero)
        
        setUp(
            for: type,
            date: date
        )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp(
        for type: ITCHClassRecordCellType,
        date: Date
    ) {
        backgroundColor = ITCHColor.backgroundGray.color
        layer.cornerRadius = Constant.View.cornerRadius
        dateLabel.text = date.configure(to: Constant.Date.format).uppercased()
        
        setUpDateTitle()
        setUpSeparator()
        setUpNavigationRow()
        
        switch type {
        case .student:
            navigationRow.pinBottom(to: self, Constant.NavigationRows.bottomOffset)
        case .teacher:
            setUpSecondNavigationRow()
            secondNavigationRow.pinBottom(to: self, Constant.NavigationRows.bottomOffset)
        }
    }
    
    private func setUpDateTitle() {
        dateLabel.textColor = ITCHColor.base30.color
        dateLabel.font = ITCHFont.bodySMedium.font
        
        addSubview(dateLabel)
        dateLabel.pinLeft(to: self, Constant.Date.leadingOffset)
        dateLabel.pinTop(to: self, Constant.Date.topOffset)
    }
    
    private func setUpSeparator() {
        separator.backgroundColor = ITCHColor.base70.color
        
        addSubview(separator)
        separator.pinTop(to: dateLabel.bottomAnchor, Constant.Separator.topOffset)
        separator.pinHorizontal(to: self, Constant.Separator.horizontalOffset)
        separator.setHeight(Constant.Separator.height)
    }
    
    private func setUpNavigationRow() {
        addSubview(navigationRow)
        navigationRow.pinTop(to: separator.bottomAnchor)
        navigationRow.pinHorizontal(to: self, Constant.NavigationRows.horizontalOffset)
    }
    
    private func setUpSecondNavigationRow() {
        addSubview(secondNavigationRow)
        secondNavigationRow.pinTop(to: navigationRow.bottomAnchor)
        secondNavigationRow.pinHorizontal(to: self, Constant.NavigationRows.horizontalOffset)
    }
}
