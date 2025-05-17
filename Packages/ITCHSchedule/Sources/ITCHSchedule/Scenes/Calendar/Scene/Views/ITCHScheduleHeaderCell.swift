//
//  ITCHScheduleHeaderCell.swift
//  ITCHSchedule
//
//  Created by Peter on 22.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHScheduleHeaderCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum ReuseIdentifier {
            static let value: String = "ITCHScheduleHeaderCell"
        }
        
        enum WrapView {
            static let topOffset: CGFloat = 20
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 12
            static let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            static let horizontalOffset: CGFloat = 16
        }
        
        enum Label {
            static let font: UIFont = ITCHFont.bodySMedium.font
            static let textColor: UIColor = ITCHColor.base30.color
            static let horizontalOffset: CGFloat = 16
            static let topOffset: CGFloat = 16
            static let bottomOffset: CGFloat = 12
            static let format: String = "EEEE, d MMMM"
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
    
    // MARK: - Configure
    func configure(with date: Date) {
        let formatted = date.configure(to: Constant.Label.format)
        titleLabel.text = formatted.prefix(1).uppercased() + formatted.dropFirst()
    }
    
    // MARK: - SetUp
    private func setUp() {
        selectionStyle = .none
        backgroundColor = .clear
        setUpWrapView()
        setUpTitleLabel()
    }
    
    private func setUpWrapView() {
        wrapView.backgroundColor = Constant.WrapView.backgroundColor
        wrapView.layer.cornerRadius = Constant.WrapView.cornerRadius
        wrapView.layer.maskedCorners = Constant.WrapView.maskedCorners
        
        contentView.addSubview(wrapView)
        wrapView.pinTop(to: contentView, Constant.WrapView.topOffset)
        wrapView.pinHorizontal(to: contentView, Constant.WrapView.horizontalOffset)
        wrapView.pinBottom(to: contentView)
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Label.textColor
        titleLabel.font = Constant.Label.font
        
        wrapView.addSubview(titleLabel)
        titleLabel.pinHorizontal(to: wrapView, Constant.Label.horizontalOffset)
        titleLabel.pinTop(to: wrapView, Constant.Label.topOffset)
        titleLabel.pinBottom(to: wrapView)
    }
}
