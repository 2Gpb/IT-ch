//
//  ITCHAccountCell.swift
//  ITCHProfile
//
//  Created by Peter on 19.05.2025.
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
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum WrapView {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 12
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum AccountRow {
            static let horizontalOffset: CGFloat = 16
            static let verticalOffset: CGFloat = 12
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let wrapView: UIView = UIView()
    private let accountRow: ITCHAccountRow = ITCHAccountRow(type: .defaultAccount)
    
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
        selectionStyle = Constant.View.selectionStyle
        backgroundColor = Constant.View.backgroundColor
        setUpWrapView()
        setUpAccountRow()
    }
    
    private func setUpWrapView() {
        wrapView.backgroundColor = Constant.WrapView.backgroundColor
        wrapView.layer.cornerRadius = Constant.WrapView.cornerRadius

        contentView.addSubview(wrapView)
        wrapView.pinHorizontal(to: contentView, Constant.WrapView.horizontalOffset)
        wrapView.pinTop(to: contentView, Constant.WrapView.topOffset)
        wrapView.pinBottom(to: contentView)
    }
    
    private func setUpAccountRow() {
        wrapView.addSubview(accountRow)
        accountRow.pinHorizontal(to: wrapView, Constant.AccountRow.horizontalOffset)
        accountRow.pinVertical(to: wrapView, Constant.AccountRow.verticalOffset)
    }
}
