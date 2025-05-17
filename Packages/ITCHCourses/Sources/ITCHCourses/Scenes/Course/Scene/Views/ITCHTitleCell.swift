//
//  Untitled.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHTitleCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHTitleCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum Title {
            static let topOffset: CGFloat = 12
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Reuse ID
    static let reuseId: String = Constant.ReuseIdentifier.value
    
    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    
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
    func configure(with text: String) {
        titleLabel.text = text
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        selectionStyle = Constant.View.selectionStyle
        setTitleLabel()
    }
    
    private func setTitleLabel() {
        titleLabel.font = ITCHFont.bodyMMedium.font
        titleLabel.textColor = ITCHColor.base0.color
        
        contentView.addSubview(titleLabel)
        titleLabel.pinTop(to: contentView, Constant.Title.topOffset)
        titleLabel.pinHorizontal(to: contentView, Constant.Title.horizontalOffset)
        titleLabel.pinBottom(to: contentView)
    }
}
