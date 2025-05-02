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
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 12
            static let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }

        enum Label {
            static let font: UIFont = ITCHFont.header5Medium.font
            static let textColor: UIColor = ITCHColor.base5.color
            static let horizontalOffset: CGFloat = 16
            static let topOffset: CGFloat = 16
        }
    }

    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()

    // MARK: - Lifecycle
    init(with title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        setUp()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }

    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        layer.cornerRadius = Constant.View.cornerRadius
        layer.maskedCorners = Constant.View.maskedCorners
        setUpTitleLabel()
    }
    
    private func setUpTitleLabel() {
        titleLabel.textColor = Constant.Label.textColor
        titleLabel.font = Constant.Label.font
        
        addSubview(titleLabel)
        titleLabel.pinHorizontal(to: self, Constant.Label.horizontalOffset)
        titleLabel.pinTop(to: self, Constant.Label.topOffset)
    }
}
