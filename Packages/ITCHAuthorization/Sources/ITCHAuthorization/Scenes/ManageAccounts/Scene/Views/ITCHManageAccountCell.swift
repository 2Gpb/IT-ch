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
        
        enum ReuseIdentifier {
            static let value: String = "ITCHManageAccountCell"
        }
        
        enum Buttons {
            static let verticalOffset: CGFloat = 4
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
    
    func configure(with model: ITCHAccountModel) {
        accountRow.configure(with: model)
    }
    
    // MARK: - SetUp
    private func setUp() {
        selectionStyle = .default
        backgroundColor = .clear
        
        addSubview(accountRow)
        accountRow.pinHorizontal(to: self, 16)
        accountRow.pinVertical(to: self, Constant.Buttons.verticalOffset)
    }
}
