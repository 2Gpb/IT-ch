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
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let userRow: ITCHUserRow = ITCHUserRow()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    func configure(with model: ITCHUserModel) {
        userRow.configure(with: model)
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = .clear
        
        addSubview(userRow)
        userRow.pinHorizontal(to: self)
        userRow.pinVertical(to: self, 4)
    }
}
