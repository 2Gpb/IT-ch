//
//  ITCHMemberCell.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHMemberCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHMemberCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum AccountRow {
            static let topOffset: CGFloat = 12
            static let horizontalOffset: CGFloat = 16
        }
        
        enum ContextActions {
            static let changeRoleTitle: String = "Изменить роль"
            static let changeRoleImage: UIImage = ITCHImage.pen20.image
            static let deleteTitle: String = "Удалить"
            static let deleteImage: UIImage = ITCHImage.trash20.image
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let accountRow: ITCHAccountRow = ITCHAccountRow(type: .options)
    
    // MARK: - Properties
    private var changeRole: (() -> Void)?
    private var delete: (() -> Void)?
    
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
        with model: ITCHAccountViewModel,
        changeRoleAction: (() -> Void)?,
        deleteAction: (() -> Void)?
    ) {
        accountRow.configure(with: model)
        
        accountRow.configureRightButtonMenu(items: makeActions(
            changeRoleAction: changeRoleAction,
            deleteAction: deleteAction
        ))
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        selectionStyle = Constant.View.selectionStyle
        setUpAccountRow()
    }
    
    private func setUpAccountRow() {
        contentView.addSubview(accountRow)
        accountRow.pinTop(to: contentView, Constant.AccountRow.topOffset)
        accountRow.pinBottom(to: contentView)
        accountRow.pinHorizontal(to: contentView, Constant.AccountRow.horizontalOffset)
    }
    
    // MARK: - Actions
    private func makeActions(
        changeRoleAction: (() -> Void)?,
        deleteAction: (() -> Void)?
    ) -> [UIAction] {
        [
            UIAction(
                title: Constant.ContextActions.changeRoleTitle,
                image: Constant.ContextActions.changeRoleImage
            ) { _ in changeRoleAction?() },

            UIAction(
                title: Constant.ContextActions.deleteTitle,
                image: Constant.ContextActions.deleteImage,
                attributes: .destructive
            ) { _ in deleteAction?() }
        ]
    }
}
