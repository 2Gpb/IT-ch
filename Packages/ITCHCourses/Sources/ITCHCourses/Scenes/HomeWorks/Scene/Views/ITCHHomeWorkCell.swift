//
//  ITCHHomeWorkCell.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHHomeWorkCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHHomeWorkCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum HomeWorkView {
            static let topOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let homeWorkView: ITCHHomeWorkView = ITCHHomeWorkView(type: .teacher)
    
    // MARK: - Properties
    private var changeRole: (() -> Void)?
    private var delete: (() -> Void)?
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    func configure(
        with title: String,
        date: Date,
        openAction: (() -> Void)?,
        editAction: (() -> Void)?
    ) {
        homeWorkView.configure(title: title, date: date)
        homeWorkView.solutionsAction = openAction
        homeWorkView.editAction = editAction
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        selectionStyle = Constant.View.selectionStyle
        setUpHomeWorkView()
    }
    
    private func setUpHomeWorkView() {
        contentView.addSubview(homeWorkView)
        homeWorkView.pinTop(to: contentView, Constant.HomeWorkView.topOffset)
        homeWorkView.pinBottom(to: contentView)
        homeWorkView.pinHorizontal(to: contentView, Constant.HomeWorkView.horizontalOffset)
    }
}
