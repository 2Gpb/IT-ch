//
//  ITCHSettingsCell.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSettingsCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHSettingsCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum SettingsRow {
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let settingsRow: ITCHSettingsRow = ITCHSettingsRow()
    
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
        with model: ITCHSettingsRowViewModel,
        switchAction: ((Bool) -> Void)? = nil
    ) {
        settingsRow.configure(with: model)
        settingsRow.switchAction = switchAction
    }
    
    // MARK: - SetUp
    private func setUp() {
        selectionStyle = Constant.View.selectionStyle
        contentView.backgroundColor = Constant.View.backgroundColor
        setUpSettingsRow()
    }
    
    private func setUpSettingsRow() {
        contentView.addSubview(settingsRow)
        settingsRow.pinCenterY(to: self)
        settingsRow.pinHorizontal(to: self, Constant.SettingsRow.horizontalOffset)
    }
}
