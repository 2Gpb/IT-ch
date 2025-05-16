//
//  ITCHMemberToAddCell.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHMemberToAddCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHMemberToAddCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .default
        }
        
        enum AccountRow {
            static let verticalOffset: CGFloat = 6
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let accountRow: ITCHAccountRow = ITCHAccountRow(type: .checkBox)
    
    // MARK: - Properties
    override var isSelected: Bool {
        get {
            accountRow.isCheck
        } set {
            accountRow.isCheck = newValue
        }
    }
    
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
    func configure(with model: ITCHAccountViewModel) {
        accountRow.configure(with: model)
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        selectionStyle = Constant.View.selectionStyle
        setUpAccountRow()
    }
    
    private func setUpAccountRow() {
        contentView.addSubview(accountRow)
        accountRow.pinVertical(to: contentView, Constant.AccountRow.verticalOffset)
        accountRow.pinHorizontal(to: contentView, Constant.AccountRow.horizontalOffset)
    }
}
