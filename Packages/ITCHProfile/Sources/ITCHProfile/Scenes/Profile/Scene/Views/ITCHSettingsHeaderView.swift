//
//  ITCHSettingsHeaderView.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSettingsHeaderView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum WrapView {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 12
            static let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            static let horizontalOffset: CGFloat = 16
        }

        enum Label {
            static let font: UIFont = ITCHFont.header5Medium.font
            static let textColor: UIColor = ITCHColor.base5.color
            static let horizontalOffset: CGFloat = 16
            static let topOffset: CGFloat = 16
            static let bottomOffset: CGFloat = 12
        }
    }

    // MARK: - UI Components
    private let wrapView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()

    // MARK: - Lifecycle
    init(with title: String) {
        super.init(frame: .zero)
        setUp(title: title)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }

    // MARK: - SetUp
    private func setUp(title: String) {
        setUpWrapView()
        setUpTitleLabel(with: title)
    }
    
    private func setUpWrapView() {
        wrapView.backgroundColor = Constant.WrapView.backgroundColor
        wrapView.layer.cornerRadius = Constant.WrapView.cornerRadius
        wrapView.layer.maskedCorners = Constant.WrapView.maskedCorners

        self.addSubview(wrapView)
        wrapView.pinHorizontal(to: self, Constant.WrapView.horizontalOffset)
        wrapView.pinVertical(to: self)
    }
    
    private func setUpTitleLabel(with text: String) {
        titleLabel.text = text
        titleLabel.textColor = Constant.Label.textColor
        titleLabel.font = Constant.Label.font
        
        wrapView.addSubview(titleLabel)
        titleLabel.pinHorizontal(to: wrapView, Constant.Label.horizontalOffset)
        titleLabel.pinTop(to: wrapView, Constant.Label.topOffset)
        titleLabel.pinBottom(to: wrapView, Constant.Label.bottomOffset)
    }
}
