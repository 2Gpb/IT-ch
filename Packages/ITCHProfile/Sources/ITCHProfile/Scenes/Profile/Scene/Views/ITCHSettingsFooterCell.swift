//
//  ITCHSettingsFooterView.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSettingsFooterCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHSettingsFooterCell"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
            static let selectionStyle: UITableViewCell.SelectionStyle = .none
        }
        
        enum FooterView {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 12
            static let maskedCorners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            static let height: CGFloat = 22
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - ReuseID
    static let reuseId: String = Constant.ReuseIdentifier.value

    // MARK: - UI Components
    private let footerView: UIView = UIView()

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }

    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        selectionStyle = Constant.View.selectionStyle
        setUpFooter()
    }
    
    private func setUpFooter() {
        footerView.backgroundColor = Constant.FooterView.backgroundColor
        footerView.layer.cornerRadius = Constant.FooterView.cornerRadius
        footerView.layer.maskedCorners = Constant.FooterView.maskedCorners
        
        contentView.addSubview(footerView)
        footerView.setHeight(Constant.FooterView.height)
        footerView.pinHorizontal(to: contentView, Constant.FooterView.horizontalOffset)
        footerView.pinVertical(to: contentView)
    }
}
