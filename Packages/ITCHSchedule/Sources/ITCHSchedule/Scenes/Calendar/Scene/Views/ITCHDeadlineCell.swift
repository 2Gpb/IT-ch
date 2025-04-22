//
//  ITCHDeadlineCell.swift
//  ITCHSchedule
//
//  Created by Peter on 22.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHDeadlineCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHDeadlineCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let horizontalOffset: CGFloat = 16
            static let separatorHeight: CGFloat = 1
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - Properties
    var isCheck: Bool = false {
        didSet {
            deadlineView.isCheck = isCheck
        }
    }
    
    // MARK: - UI Components
    private let deadlineView: ITCHDeadlineView = ITCHDeadlineView()
    private let separatorView: UIView = UIView()
    
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
    func configure(with viewModel: ITCHDeadlineViewModel, isLastCell: Bool) {
        deadlineView.configure(with: viewModel)
        separatorView.isHidden = isLastCell
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        addSubview(deadlineView)
        deadlineView.pinVertical(to: self)
        deadlineView.pinHorizontal(to: self, Constant.View.horizontalOffset)
        
        setUpSeparatorView()
    }
    
    private func setUpSeparatorView() {
        separatorView.backgroundColor = ITCHColor.base70.color
        
        addSubview(separatorView)
        separatorView.pinBottom(to: self)
        separatorView.pinHorizontal(to: self, Constant.View.horizontalOffset)
        separatorView.setHeight(Constant.View.separatorHeight)
    }
}
