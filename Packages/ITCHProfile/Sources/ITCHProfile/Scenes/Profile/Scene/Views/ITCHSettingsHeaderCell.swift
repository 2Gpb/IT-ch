//
//  ITCHSettingsHeaderView.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSettingsHeaderCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHSettingsHeaderCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum WrapView {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 12
            static let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            static let horizontalOffset: CGFloat = 16
            static let topOffset: CGFloat = 20
        }

        enum Label {
            static let font: UIFont = ITCHFont.header5Medium.font
            static let textColor: UIColor = ITCHColor.base5.color
            static let horizontalOffset: CGFloat = 16
            static let topOffset: CGFloat = 16
            static let bottomOffset: CGFloat = 8
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value

    // MARK: - UI Components
    private let wrapView: UIView = UIView()
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
    func configure(with title: String) {
        titleLabel.text = title
    }

    // MARK: - SetUp
    private func setUp() {
        selectionStyle = Constant.View.selectionStyle
        backgroundColor = Constant.View.backgroundColor
        setUpWrapView()
        setUpTitleLabel()
    }
    
    private func setUpWrapView() {
        wrapView.backgroundColor = Constant.WrapView.backgroundColor
        wrapView.layer.cornerRadius = Constant.WrapView.cornerRadius
        wrapView.layer.maskedCorners = Constant.WrapView.maskedCorners

        contentView.addSubview(wrapView)
        wrapView.pinHorizontal(to: contentView, Constant.WrapView.horizontalOffset)
        wrapView.pinTop(to: contentView, Constant.WrapView.topOffset)
        wrapView.pinBottom(to: contentView)
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Label.textColor
        titleLabel.font = Constant.Label.font
        
        wrapView.addSubview(titleLabel)
        titleLabel.pinHorizontal(to: wrapView, Constant.Label.horizontalOffset)
        titleLabel.pinTop(to: wrapView, Constant.Label.topOffset)
        titleLabel.pinBottom(to: wrapView, Constant.Label.bottomOffset)
    }
}
