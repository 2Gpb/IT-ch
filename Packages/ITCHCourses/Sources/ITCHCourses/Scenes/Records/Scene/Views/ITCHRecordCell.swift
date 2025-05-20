//
//  ITCHRecordCell.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHUtilities

final class ITCHRecordCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHRecordCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum ClassRecordView {
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let classRecordView: ITCHClassRecordView = ITCHClassRecordView()
    
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
        for role: ITCHCourseUserRole,
        with date: Date,
        openAction: (() -> Void)?,
        editAction: (() -> Void)?
    ) {
        classRecordView.configure(for: role, with: date)
        classRecordView.openRecordAction = openAction
        classRecordView.editAction = editAction
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        selectionStyle = Constant.View.selectionStyle
        setUpClassRecordView()
    }
    
    private func setUpClassRecordView() {
        contentView.addSubview(classRecordView)
        classRecordView.pinTop(to: contentView, Constant.ClassRecordView.topOffset)
        classRecordView.pinBottom(to: contentView)
        classRecordView.pinHorizontal(to: contentView, Constant.ClassRecordView.horizontalOffset)
    }
}
