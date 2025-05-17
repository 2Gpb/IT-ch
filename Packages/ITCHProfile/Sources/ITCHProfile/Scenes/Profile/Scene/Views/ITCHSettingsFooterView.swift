//
//  ITCHSettingsFooterView.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSettingsFooterView: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = .clear
        }
        
        enum FooterView {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 12
            static let maskedCorners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            static let height: CGFloat = 16
            static let horizontalOffset: CGFloat = 16
        }
    }

    // MARK: - UI Components
    private let footerView: UIView = UIView()

    // MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        setUp()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }

    // MARK: - SetUp
    private func setUp() {
        backgroundColor = Constant.View.backgroundColor
        setUpFooter()
    }
    
    private func setUpFooter() {
        footerView.backgroundColor = Constant.FooterView.backgroundColor
        footerView.layer.cornerRadius = Constant.FooterView.cornerRadius
        footerView.layer.maskedCorners = Constant.FooterView.maskedCorners
        
        addSubview(footerView)
        footerView.setHeight(Constant.FooterView.height)
        footerView.pinHorizontal(to: self, Constant.FooterView.horizontalOffset)
        footerView.pinVertical(to: self)
    }
}
