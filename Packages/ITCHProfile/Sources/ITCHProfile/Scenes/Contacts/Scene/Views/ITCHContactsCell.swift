//
//  ITCHContactsCell.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHContactsCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHContactsCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
        }
        
        enum LanguageRow {
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - ReuseID
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
    func configure(with title: String, image: UIImage) {
        navigationRow.configure(title: title, image: image)
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        setUpNavigationRow()
    }
    
    private func setUpNavigationRow() {
        contentView.addSubview(navigationRow)
        navigationRow.pinCenterY(to: contentView)
        navigationRow.pinHorizontal(to: contentView, Constant.LanguageRow.horizontalOffset)
    }
}
