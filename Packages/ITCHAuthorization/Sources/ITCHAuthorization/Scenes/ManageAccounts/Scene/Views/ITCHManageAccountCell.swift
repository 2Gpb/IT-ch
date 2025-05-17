//
//  ITCHManageAccountCell.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHManageAccountCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let selectionStyle: UITableViewCell.SelectionStyle = .default
            static let backgroundColor: UIColor = .clear
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHManageAccountCell"
        }
        
        enum Row {
            static let verticalOffset: CGFloat = 6
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let accountRow: ITCHAccountRow = ITCHAccountRow(type: .deleteAccount)
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    func configure(with model: ITCHAccountViewModel) {
        accountRow.configure(with: model)
    }
    
    // MARK: - SetUp
    private func setUp() {
        selectionStyle = Constant.View.selectionStyle
        backgroundColor = Constant.View.backgroundColor
        
        contentView.addSubview(accountRow)
        accountRow.pinHorizontal(to: contentView, Constant.Row.horizontalOffset)
        accountRow.pinVertical(to: contentView, Constant.Row.verticalOffset)
    }
}
