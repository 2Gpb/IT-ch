//
//  ITCHLanguageCell.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHLanguageCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHLanguageCell"
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
    
    // MARK: - Properties
    var isCheck: Bool = false {
        didSet {
            languageRow.isCheck = isCheck
        }
    }
    
    // MARK: - UI Components
    private let languageRow: ITCHNavigationRow = ITCHNavigationRow(type: .checkmark)
    
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
    func configure(with title: String, isChecked: Bool) {
        languageRow.configure(title: title)
        languageRow.isCheck = isChecked
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        setUpThemeRow()
    }
    
    private func setUpThemeRow() {
        contentView.addSubview(languageRow)
        languageRow.pinCenterY(to: contentView)
        languageRow.pinHorizontal(to: contentView, Constant.LanguageRow.horizontalOffset)
    }
}
