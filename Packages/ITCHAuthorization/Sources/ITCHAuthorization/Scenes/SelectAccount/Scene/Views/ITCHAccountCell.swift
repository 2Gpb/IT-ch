//
//  ITCH.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHAccountCell: UITableViewCell {
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
            static let value: String = "ITCHAccountCell"
        }
        
        enum Rows {
            static let title: String = "Добавить аккаунт"
            static let verticalOffset: CGFloat = 6
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let accountRow: ITCHAccountRow = ITCHAccountRow(type: .account)
    private let addAccountRow: ITCHAccountRow = ITCHAccountRow(type: .addAccount)
    
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
    func configure(with model: ITCHAccountModel? = nil, type: ITCHAccountRowType) {
        if let model {
            accountRow.configure(
                with: ITCHAccountViewModel(
                    image: model.image,
                    name: model.name,
                    info: model.info
                )
            )
        }
        
        addAccountRow.configure(with: ITCHAccountViewModel(name: Constant.Rows.title))
        
        switch type {
        case .account:
            addAccountRow.isHidden = true
        case .addAccount:
            accountRow.isHidden = true
        default:
            return
        }
    }
    
    // MARK: - SetUp
    private func setUp() {
        selectionStyle = Constant.View.selectionStyle
        backgroundColor = Constant.View.backgroundColor
        
        addSubview(accountRow)
        accountRow.pinHorizontal(to: self, Constant.Rows.horizontalOffset)
        accountRow.pinVertical(to: self, Constant.Rows.verticalOffset)
        
        addSubview(addAccountRow)
        addAccountRow.pinHorizontal(to: self, Constant.Rows.horizontalOffset)
        addAccountRow.pinVertical(to: self, Constant.Rows.verticalOffset)
    }
}
