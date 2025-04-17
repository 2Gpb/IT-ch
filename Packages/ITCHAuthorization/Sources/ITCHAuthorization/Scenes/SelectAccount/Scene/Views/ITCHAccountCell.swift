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
        
        enum ReuseIdentifier {
            static let value: String = "ITCHAccountCell"
        }
        
        enum Buttons {
            static let title: String = "Добавить аккаунт"
            static let verticalOffset: CGFloat = 4
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
    
    func configure(with model: ITCHAccountModel? = nil, type: ITCHAccountRowType) {
        if let model {
            accountRow.configure(with: model)
        }
        
        addAccountRow.configure(with: ITCHAccountModel(name: Constant.Buttons.title))
        
        switch type {
        case .account:
            addAccountRow.isHidden = true
        case .addAccount:
            accountRow.isHidden = true
        }
    }
    
    // MARK: - SetUp
    private func setUp() {
        selectionStyle = .none
        backgroundColor = .clear
        
        addSubview(accountRow)
        accountRow.pinHorizontal(to: self)
        accountRow.pinVertical(to: self, Constant.Buttons.verticalOffset)
        
        addSubview(addAccountRow)
        addAccountRow.pinHorizontal(to: self)
        addAccountRow.pinVertical(to: self, Constant.Buttons.verticalOffset)
    }
}
