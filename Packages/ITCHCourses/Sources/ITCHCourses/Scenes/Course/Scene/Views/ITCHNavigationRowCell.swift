//
//  ITCHNavigationRowCell.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHNavigationRowCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHNavigationRowCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .default
        }
        
        enum NavigationRow {
            static let verticalOffset: CGFloat = 2
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let navigationRow: ITCHNavigationRow = ITCHNavigationRow(type: .chevron)
    
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
    func configure(with text: String) {
        navigationRow.configure(title: text)
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        selectionStyle = Constant.View.selectionStyle
        setNavigationRow()
    }
    
    private func setNavigationRow() {
        contentView.addSubview(navigationRow)
        navigationRow.pinHorizontal(to: contentView, Constant.NavigationRow.horizontalOffset)
        navigationRow.pinVertical(to: contentView, Constant.NavigationRow.verticalOffset)
    }
}
