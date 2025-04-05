//
//  PrimaryHomeWorkCell.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 02.04.2025.
//

import UIKit

final class ITCHHomeWorkCell: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let cornerRadius: CGFloat = 12
        }
        
        enum Title {
            static let topOffset: CGFloat = 16
            static let leadingOffset: CGFloat = 20
        }
        
        enum DateImage {
            static let image: UIImage? = UIImage(named: "Time")?.withRenderingMode(.alwaysTemplate)
            static let size: CGFloat = 20
        }
        
        enum DateStack {
            static let dateFormat: String = "dd.MM.yy, HH:mm"
            static let spacing: CGFloat = 4
            static let topOffset: CGFloat = 8
            static let leadingOffset: CGFloat = 20
        }
        
        enum Separator {
            static let height: CGFloat = 1
            static let horizontalOffset: CGFloat = 20
            static let topOffset: CGFloat = 8
        }
        
        enum NavigationRows {
            static let teacherTitle: String = "Посмотреть решения"
            static let teacherSecondTitle: String = "Редактировать"
            static let studentTitle: String = "Добавить решение"
            static let assistantTitle: String = "Проверить решения"
            static let horizontalOffset: CGFloat = 20
            static let bottomOffset: CGFloat = 8
        }
    }
    
    // MARK: - UI Components
    private let title: UILabel = UILabel()
    private let dateStack: UIStackView = UIStackView()
    private let dateLabel: UILabel = UILabel()
    private let dateImage: UIImageView = UIImageView()
    private let separator: UIView = UIView()
    private var navigationRow: ITCHNavigationRow = ITCHNavigationRow()
    private var secondNavigationRow: ITCHNavigationRow = ITCHNavigationRow()
    
    // MARK: - Lifecycle
    init(title: String, date: Date, type: ITCHHomeWorkCellType) {
        super.init(frame: .zero)
        setUp()
        
        self.title.text = title
        self.dateLabel.text = configure(with: date)
        
        switch type {
        case .teacher:
            navigationRow.title = Constant.NavigationRows.teacherTitle
            secondNavigationRow.title = Constant.NavigationRows.teacherSecondTitle
            
            setUpSecondNavigationRow()
            secondNavigationRow.pinBottom(to: self, Constant.NavigationRows.bottomOffset)
        case .student:
            navigationRow.title = Constant.NavigationRows.studentTitle
            navigationRow.pinBottom(to: self, Constant.NavigationRows.bottomOffset)
        case .assistant:
            navigationRow.title = Constant.NavigationRows.assistantTitle
            navigationRow.pinBottom(to: self, Constant.NavigationRows.bottomOffset)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = ITCHColor.backgroundGray.color
        layer.cornerRadius = Constant.View.cornerRadius
        
        setUpTitle()
        setUpDateImage()
        setUpDateLabel()
        setUpDateStack()
        setUpSeparator()
        setUpNavigationRow()
    }
    
    private func setUpTitle() {
        title.textColor = ITCHColor.base0.color
        title.font = ITCHFont.bodyMMedium.font
        
        addSubview(title)
        title.pinTop(to: self, Constant.Title.topOffset)
        title.pinLeft(to: self, Constant.Title.leadingOffset)
    }
    
    private func setUpDateImage() {
        dateImage.image = Constant.DateImage.image
        dateImage.tintColor = ITCHColor.red50.color
        
        dateStack.addArrangedSubview(dateImage)
        dateImage.setWidth(Constant.DateImage.size)
        dateImage.setHeight(Constant.DateImage.size)
    }
    
    private func setUpDateLabel() {
        dateLabel.textColor = ITCHColor.base30.color
        dateLabel.font = ITCHFont.bodySMedium.font
        
        dateStack.addArrangedSubview(dateLabel)
    }
    
    private func setUpDateStack() {
        dateStack.axis = .horizontal
        dateStack.spacing = Constant.DateStack.spacing
        
        addSubview(dateStack)
        dateStack.pinTop(to: title.bottomAnchor, Constant.DateStack.topOffset)
        dateStack.pinLeft(to: self, Constant.DateStack.leadingOffset)
    }
    
    private func setUpSeparator() {
        separator.backgroundColor = ITCHColor.base70.color
        
        addSubview(separator)
        separator.pinTop(to: dateStack.bottomAnchor, Constant.Separator.topOffset)
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
    
    // MARK: - Private methods
    private func configure(with date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constant.DateStack.dateFormat
        let dateString = formatter.string(from: date)
        
        return dateString
    }
}
